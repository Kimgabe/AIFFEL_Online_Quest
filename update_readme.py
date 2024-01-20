import requests
import re

# GitHub API를 통해 특정 저장소의 폴더 목록을 가져오는 함수
def get_folders(repo):
    url = f"https://api.github.com/repos/{repo}/contents/"
    response = requests.get(url)
    # '.'으로 시작하는 폴더는 제외
    folders = [item for item in response.json() if item['type'] == 'dir' and not item['name'].startswith('.')]
    return folders

# 폴더 이름에서 숫자를 추출하는 함수
def extract_number(folder_name):
    match = re.search(r'\d+', folder_name)
    if match:
        return int(match.group())
    return float('inf')

# README.md 파일을 업데이트하는 함수
def update_readme(repo, folders, original_content):
    # "## 📑Quest List📑" 섹션과 그 이하 내용 제거
    start_index = original_content.find("## 📑Quest List📑")
    if start_index != -1:
        original_content = original_content[:start_index]

    # 새로운 "## 📑Quest List📑" 테이블 생성
    new_table = "## 📑Quest List📑\n\n"
    new_table += "| 퀘스트명 | URL |\n"
    new_table += "| --- | --- |\n"

    sorted_folders = sorted(folders, key=lambda x: extract_number(x['name']))
    for folder in sorted_folders:
        folder_name = folder['name']
        folder_url = folder['html_url']
        new_table += f"| {folder_name} | [Link]({folder_url}) |\n"

    # README.md 파일의 기존 내용 끝에 새로운 테이블 추가
    updated_content = original_content + new_table
    return updated_content

# GitHub 저장소와 폴더 목록을 설정
repo = "Kimgabe/AIFFEL_Online_Quest"

# 기존 README.md 내용을 읽기
with open("README.md", "r") as file:
    original_content = file.read()

folders = get_folders(repo)
updated_content = update_readme(repo, folders, original_content)

# README.md 파일에 쓰기
with open("README.md", "w") as file:
    file.write(updated_content)
