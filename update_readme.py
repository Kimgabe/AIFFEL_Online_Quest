import requests
import re

# GitHub API를 통해 특정 저장소의 폴더 목록을 가져오는 함수
def get_folders(repo):
    url = f"https://api.github.com/repos/{repo}/contents/"
    response = requests.get(url)
    folders = [item for item in response.json() if item['type'] == 'dir']
    return folders

# 폴더 이름에서 숫자를 추출하는 함수
def extract_number(folder_name):
    # 폴더 이름에서 첫 번째 숫자 시퀀스를 찾습니다
    match = re.search(r'\d+', folder_name)
    if match:
        return int(match.group())
    return float('inf')  # 숫자가 없는 경우 매우 큰 수를 반환

# README.md 파일을 업데이트하는 함수
def update_readme(repo, folders):
    # 기존 README.md 내용을 읽기
    with open("README.md", "r") as file:
        original_content = file.read()

    # 표를 추가할 새로운 내용 생성
    new_content = "\n\n## 📑Quest List📑\n\n"  # 새로운 섹션 제목 추가
    new_content += "| 퀘스트명 | URL |\n"  # 표의 헤더 행 추가
    new_content += "| --- | --- |\n"  # 표의 헤더 행 아래 구분선 추가

    # 폴더를 숫자 순으로 정렬
    sorted_folders = sorted(folders, key=lambda x: extract_number(x['name']))

    for folder in sorted_folders:
        folder_name = folder['name']
        folder_url = folder['html_url']
        new_content += f"| {folder_name} | [Link]({folder_url}) |\n" # 각 폴더에 대한 행 추가

    # 기존 내용과 새로운 내용을 합쳐서 파일에 쓰기
    with open("README.md", "w") as file:
        file.write(original_content + new_content)

# GitHub 저장소와 폴더 목록을 설정
repo = "Kimgabe/AIFFEL_Online_Quest"
folders = get_folders(repo)

# README.md 파일 업데이트 함수 호출
update_readme(repo, folders)
