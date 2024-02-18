# 필요 라이브러리
from typing import Dict
from fastapi import FastAPI, HTTPException
import os
import openai
from dotenv import load_dotenv
import requests
from datetime import datetime, timedelta
from xml.etree import ElementTree
from requests.exceptions import HTTPError  #

# 환경 변수 로드
load_dotenv('./gabe.env')


# 분류값에 따른 단위 설정
unit_dict = {
    "POP": "%",       # 강수확률
    "PTY": "",        # 강수형태(코드값이므로 단위 없음)
    "PCP": "mm",      # 1시간 강수량
    "REH": "%",       # 습도
    "SNO": "cm",      # 1시간 신적설
    "SKY": "",        # 하늘상태(코드값이므로 단위 없음)
    "TMP": "℃",       # 1시간 기온
    "TMN": "℃",       # 일 최저기온
    "TMX": "℃",       # 일 최고기온
    "UUU": "m/s",     # 풍속(동서성분)
    "VVV": "m/s",     # 풍속(남북성분)
    "WAV": "M",       # 파고
    "VEC": "deg",     # 풍향
    "WSD": "m/s"      # 풍속
}

# 항목명 한글 매핑
name_dict = {
    "POP": "강수확률",
    "PTY": "강수형태",
    "PCP": "1시간 강수량",
    "REH": "습도",
    "SNO": "1시간 신적설",
    "SKY": "하늘상태",
    "TMP": "기온",
    "TMN": "일 최저기온",
    "TMX": "일 최고기온",
    "UUU": "풍속(동서성분)",
    "VVV": "풍속(남북성분)",
    "WAV": "파고",
    "VEC": "풍향",
    "WSD": "풍속"
}

# 하늘상태, 강수형태 코드 매핑
sky_dict = {"1": "맑음", "3": "구름많음", "4": "흐림"}
pty_dict = {"0": "없음", "1": "비", "2": "비/눈", "3": "눈", "4": "소나기"}

# 온도별 옷차림 정보
clothes_dict = {
    (28, float('inf')): ["민소매", "반팔 티셔츠", "반바지(핫팬츠)", "민소매 원피스", "짧은 치마", "린넨"],
    (23, 27): ["반팔 티셔츠", "얇은 셔츠", "얇은 긴팔 티셔츠", "반바지", "면바지"],
    (20, 22): ["얇은 가디건", "긴팔 티셔츠", "셔츠", "블라우스", "후드티", "면바지", "슬랙스", "7부 바지", "청바지"],
    (17, 19): ["얇은 니트", "얇은 가디건", "얇은 재킷", "후드티", "스웨트 셔츠(맨투맨)", "바람막이", "긴바지", "청바지", "슬랙스", "스키니진"],
    (12, 16): ["재킷", "가디건", "청재킷", "야상", "니트", "스웨트 셔츠(맨투맨)", "셔츠", "기모 후드티", "청바지", "면바지", "살구색 스타킹"],
    (9, 11): ["재킷", "야상", "점퍼", "트렌치 코트", "니트", "청바지", "면바지", "검은색 스타킹", "기모 바지", "레이어드"],
    (5, 8): ["코트", "울 코트", "가죽 재킷", "플리스", "내복", "니트", "레깅스", "청바지", "두꺼운 바지", "스카프", "기모"],
    (-float('inf'), 4): ["패딩", "두꺼운 코트", "누빔", "내복", "목도리", "장갑", "기모", "방한용품"]
}


def weather_recommendation():
    now = datetime.now()

    # API 제공 base_time 목록
    base_times = ["0200", "0500", "0800",
                  "1100", "1400", "1700", "2000", "2300"]
    # 현재 시간보다 작은 base_times 중 가장 큰 값을 찾기 위한 초기 설정
    cur_base_time = "2300"  # 기본값
    for base_time in base_times:
        # 현재 시간과 base_time 비교 (시, 분으로 변환하여 비교)
        hour, minute = int(base_time[:2]), int(base_time[2:])
        if now.hour > hour or (now.hour == hour and now.minute >= 10):  # API 제공 시간 이후 조건
            cur_base_time = base_time
        else:
            break

    # 현재 시간이 첫 번째 API 제공 시간(02:10) 이전인 경우
    if now.hour < 2 or (now.hour == 2 and now.minute < 10):
        base_date = (now - timedelta(days=1)).strftime("%Y%m%d")  # 하루 전 날짜
    else:
        base_date = now.strftime("%Y%m%d")

    # API 호출을 위한 설정값
    service_key_enc = os.getenv("service_key_enc")
    service_key_dec = os.getenv("service_key_dec")
    base_url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
    params = {
        "serviceKey": service_key_enc,
        "numOfRows": 20,
        "pageNo": 1,
        "base_date": base_date,
        "base_time": cur_base_time,  # 수정된 로직을 통해 결정된 base_time
        "nx": 55,
        "ny": 127,
        "dataType": "XML"
    }

    # API 호출
    try:
        response = requests.get(base_url, params=params)
        response.raise_for_status()  # 오류 발생 시 예외 처리
    except HTTPError as http_err:
        print(f'HTTP error occurred: {http_err}')
        return {"error": "API 호출 실패"}

    try:
        root = ElementTree.fromstring(response.content)
        if root.find(".//errMsg") is not None and root.find(".//errMsg").text == "SERVICE ERROR":
            # 서비스 키 오류 발생 시 다른 서비스 키로 재시도
            params["serviceKey"] = service_key_dec
            response = requests.get(base_url, params=params)
            response.raise_for_status()  # 오류 발생 시 예외 처리
            root = ElementTree.fromstring(response.content)
    except ElementTree.ParseError as e:
        print(f'XML parsing error occurred: {e}')
        return {"error": "XML 파싱 오류"}

    # 응답 XML 파싱 및 날씨 정보 조회
    weather_info = {}
    for item in root.findall('./body/items/item'):
        category = item.find('category').text
        fcstValue = item.find('fcstValue').text
        weather_info[category] = fcstValue

    # 기온 정보 저장 변수
    temperature = float(weather_info.get("TMP", 0))  # 기본값 0으로 설정

    def recommend_clothes(temperature):
        # 온도별 옷차림 정보는 사전에 정의된 `clothes_dict`를 사용하여 구현
        for temp_range, clothes in clothes_dict.items():
            if temp_range[0] <= temperature <= temp_range[1]:
                return clothes
        return ["적절한 옷차림 정보가 없습니다."]

    # 온도에 따른 옷차림 추천
    recommended_clothes = recommend_clothes(temperature)

    def call_gpt3_to_generate_outfit(weather_info, recommended_clothes):
        openai.api_key = os.getenv('OPENAI_API_KEY')
        # GPT-3에 전달할 프롬프트 구성
        prompt = f"오늘의 기온은 {weather_info['TMP']}℃입니다. 하늘상태는 {weather_info['SKY']}이며, 강수형태는 {weather_info['PTY']}입니다. 강수확률은 {weather_info['POP']}%입니다.\n\n이러한 날씨에 적합한 옷차림은 {', '.join(recommended_clothes)}입니다.\n\n이 정보를 바탕으로 사용자에게 오늘의 옷차림을 추천하는 문장을 작성해주세요."

        try:
            # `v1/chat/completions` 엔드포인트를 사용하는 코드로 변경
            response = openai.ChatCompletion.create(
                model="gpt-3.5-turbo",
                messages=[
                    {"role": "system",
                        "content": "이 사용자에게 오늘의 날씨에 맞는 옷차림을 기상캐스터가 일기예보로 얘기 하듯이 추천해주세요."},
                    {"role": "user", "content": prompt},
                ]
            )

            # GPT-3의 응답으로부터 추천 문장 추출
            recommendation_text = response.choices[0].message['content'].strip(
            )
            return recommendation_text
        except Exception as e:
            print(f'Error occurred while calling GPT-3: {e}')
            return {"error": "GPT-3 호출 오류"}

    # GPT-3의 응답으로부터 추천 문장 추출
    recommendation_text = call_gpt3_to_generate_outfit(
        weather_info, recommended_clothes)

    # 결과 반환
    return {
        "temperature": temperature,
        "recommended_clothes": recommended_clothes,
        "recommendation_text": recommendation_text
    }


"""
fastAPI를 사용하기 위한 라이브러리 및 코드 작성
"""


base_url = os.getenv(
    "BASE_URL", "https://weather-cloth-fastapi-807c88b6bcd8.herokuapp.com/")

app = FastAPI(base_url=base_url)

# fastAPI 접속 엔드포인트


@app.get("/")
async def read_root():
    return {"message": "Closet in the Clouds!"}


# 날씨 정보 수집 및 문장생성 엔드포인트
@app.get("/weather_recommendation")
async def get_weather_recommendation() -> Dict:
    try:
        result = weather_recommendation()
        if "error" in result:
            raise HTTPException(status_code=400, detail=result["error"])
        return {
            "temperature": result["temperature"],
            "recommended_clothes": result["recommended_clothes"],
            "recommendation_text": result["recommendation_text"]
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
