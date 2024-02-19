# 📌Intro.
- AIFFEL 7th 의 Flutter 을 배우는 과정의 마지막 Main Quest로 차후 AIFFELthon에 제안할 아이디어를 구현해봅니다.
- 이를 위해 앱의 구성을 기획하고, 기획한 내용대로 Flutter를 사용해 앱을 구현합니다.
- (optional) 그리고, 가능하다면 fastAPI를 통해 구상한 기능을 앱과 연동합니다.

---

# CIC OOTD 앱 설명 및 작동과정 가이드

- 이 프로젝트는 Flutter와 FastAPI를 사용하여 현재 날씨에 맞는 옷차림을 추천하는 앱입니다.
- 날씨 정보는 기상청 API를 통해 확보하고, 추천의류에 대한 정보는 기온별 옷차림 정보를 기반으로 정리하였고, 출력 메시지는 gpt3 api를 사용해 수집한 날씨 및 추천 의상 정보를 기반으로 문장을 생성하도록 구현하였습니다.

---

## 기능

- 현재 날씨 정보에 기반한 옷차림 추천
- 온도별 옷차림 시각화 (차후 CLIP등을 사용해 구현 예정, 현재는 사전에 stable diffusion으로 생성된 이미지를 날씨정보에 맵핑하여 사용)

## 👉 앱 구동 이미지 예시
![CIC OOTD 예시](./examples/CIC_OOTD_examples.png)

---

### 실제 이미지 구동과정 (정상 작동) 🙆‍♀️
![CIC_OOTD 정상작동](./examples/CIC_OOTD_activation.gif)

### 실제 이미지 구동과정 (오류 발생) 🙅‍♀️
![CIC_OOTD 정상작동](./examples/CIC_OOTD_error.gif)

---

## ⚙ 기술 스택 ⚙

- 프론트엔드: Flutter
- 백엔드: FastAPI
- 배포: Heroku

## 설치 및 실행 방법

### 사전 요구 사항

- Flutter
- Python
- 필요한 Python 패키지: FastAPI, Uvicorn, Requests, python-dotenv, OpenAI

### 설치 절차

1. 저장소 클론:
   ```bash
   git clone https://github.com/your-repository/flutter-fastapi-clothes-recommendation.git
   ```
2. 프론트엔드 의존성 설치:
   ```bash
   cd flutter-fastapi-clothes-recommendation/flutter_app && flutter pub get
   ```
3. 백엔드 의존성 설치:
   ```bash
   cd ../fastapi_app && pip install -r requirements.txt
   ```

### 실행 방법

- 백엔드:
  ```bash
  uvicorn main:app --reload
  ```
- 프론트엔드:
  ```bash
  flutter run
  ```

## 앱 사용 방법

1. 앱을 실행하면 위치권한 사용 허가를 요구하는 팝업이 뜨고 사용자의 동의를 구합니다.
2. 이후, 첫 화면에서 '오늘 입을 옷 추천받기!' 버튼을 볼 수 있습니다.
3. 이 버튼을 클릭하면 앱은 사용자의 현재 위치를 기반으로 날씨 정보를 조회합니다. 
   - 앱에서는 WGS86 기반 좌표계로 좌표를 수집하고 fastAPI 서버로 전송합니다.
   - 서버에 저장된 기상청 API좌표계정보가 담긴 csv파일에서 앱에서 입력받은 좌표정보와 가장 근사값을 가진 좌표가 있는 행을 유클리드 거리 기반으로 찾습니다.
   - 해당 행에 입력된 기상청 고유의 격자 좌표(좌표 X,좌표 Y)를 찾습니다.
   - 수집한 날짜, 시간, 좌표 정보를 기상청 API에 전송하여 사용자 위치에서의 날씨 정보를 받아옵니다.
4. 기상청 API로부터 받은 날씨정보를 기반으로 추천 의류정보를 도출해 냅니다. (온도별 옷차림 추천 정보 활용)
5. 날씨 정보에 따른 옷차림 추천을 받기 위해, 앱은 내부적으로 FastAPI 백엔드 서버에 HTTP 요청을 보냅니다.
6. 도출된 의류정보와 날시정보를 gpt3 api에 전달합니다.
7. 이때, gpt에 프롬프트로 역할을 부여하고, 문장 생성 스타일을 함께 전달 합니다.
8. gpt3에서 전달받은 추천코디 문구, 온도 정보를 다시 앱으로 전송합니다.
9. 앱은 받은 추천 정보를 사용자에게 시각적으로 표시합니다. 이때, 온도별로 다른 이미지를 보여주어 사용자가 추천받은 옷차림을 쉽게 이해할 수 있도록 합니다.

## FastAPI와 Flutter 앱의 연계 작동 방식

1. **HTTP 요청**: 사용자가 '오늘 입을 옷 추천받기!' 버튼을 클릭하면, Flutter 앱은 FastAPI 백엔드 서버의 `/weather_recommendation` 엔드포인트로 HTTP GET 요청을 보냅니다. 이 요청은 사용자의 현재 위치 정보를 포함할 수 있으나, 현재 예제 코드에는 구현되어 있지 않습니다.

2. **날씨 정보 처리**: FastAPI 백엔드 서버는 요청을 받으면, 외부 날씨 정보 API를 호출하여 현재 날씨 데이터를 가져옵니다. 가져온 날씨 데이터는 온도, 강수 확률, 습도 등을 포함합니다.

3. **옷차림 추천**: 서버는 날씨 데이터를 분석하여 현재 온도에 적합한 옷차림을 결정합니다. 옷차림 추천은 사전에 정의된 온도별 옷차림 정보를 바탕으로 합니다.

4. **응답 생성**: 추천된 옷차림 정보와 함께, FastAPI 서버는 GPT-3을 사용하여 사용자 친화적인 추천 문장을 생성합니다. 이 문장은 현재 날씨 상황과 추천 옷차림을 설명합니다.

5. **Flutter 앱으로 응답 전송**: 생성된 추천 문장과 옷차림 정보는 JSON 형식으로 Flutter 앱에 응답으로 보내집니다.

6. **사용자 인터페이스 업데이트**: Flutter 앱은 받은 응답을 파싱하여 사용자에게 추천 옷차림과 함께 날씨 상황을 설명하는 문장을 보여줍니다. 온도에 따라 다른 이미지를 표시하여, 사용자가 추천받은 옷차림을 더 잘 이해할 수 있게 합니다.

# Reference

- [기상청 OPen API](https://data.kma.go.kr/cmmn/main.do)
- [FastAPI](https://fastapi.tiangolo.com/)
- [개발자의 공부법! 파이썬 FastAPI 공식문서로 처음부터 공부하기](https://www.youtube.com/live/ZqSpl0Ic8ik?si=QntTuDySmxxEtz35)
- [How To Deploy FastAPI To Heroku](https://youtu.be/lzp6YvJMRL4?si=IoLGPliNTI5ocDOv)
- [코딩셰프-플러터(Flutter) 조금 매운맛🌶️ 강좌 14 | 날씨 앱(weather app) 만들기 2: JSON parsing(제이슨 파싱)](https://youtu.be/ccq1yCmNzdk?si=TySA7UEmcILLp3OD)


---

# 🤔 회고

## KEEP
- 앱의 구조를 먼저 그림과 함께 기획하고, fastAPI 프로그램 로직을 구현하여 기능적으로 작동하는지 확인한 뒤에 플러터 구성을 하였다.
- 이러한 방법으로 시간내에 기능 구현을 빠르게 달성할 수 있었다.

## PROBLEM
- flutter
   - 구조 자체는 단순한 구였지만, 여러 예외 처리를 하고, 변수를 유형에 맞게 처리하는 부분에서 많이 헤맸다.
   - 특히, http 로 통신하는 과정에서 발생하는 메시지에 디버깅을 제대로 하지 않아 원인 파악에 어려움을 겪었다.
- fastAPI
   - heroku라는 서비스를 통해 배포를 하였는데, 처음 해보는 과정이라 자료를 찾아보고 하는 방법을 정리하는 것에 좀 어려움을 겪었다.
   - `Procfile`에 base url을 설정하는 부분이나, `requirements.txt` 에 라이브러리 버전 관리를 하는 부분 등에 대한 개념이 없어 어려웠다.
   - deploy한 서버를 앱과 연동시킬때, 제대로 처리 되지 않고 에러가 발생하는 부분에 대해서도 어려움을 겪었다.
      - 에러의 원인에 대해 디버깅을 제대로 해보지 않아서 코드에 문제가 있는지를 검토하느라 많은 시간을 소모했다.

## TRY
- 머리속에서 생각한 내용이 구현되는것에는 체계적인 구상이 기반되어야 한다는걸 확실히 느꼈다.
- 다만, 기본적인 틀을 잡고 큰 기능들은 구현을 한 뒤에 추가적으로 수정/보완하면서 진행해야 진척이 생긴다는 걸 알게 되었다. (일종의 Agile 방식)
- 이러한 방식을 다음 프로젝트에서도 잘 활용할 수 있도록 해야겠다.
