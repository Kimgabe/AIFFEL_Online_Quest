import requests
import os

# 깃허브 API를 사용하여 폴더 목록 가져오기


def get_folders(repo):
    url = f"https://api.github.com/repos/{repo}/contents/"
    response = requests.get(url)
    folders = [item for item in response.json() if item['type'] == 'dir']
    return sorted(folders, key=lambda x: x['name'])

# README 파일 업데이트


def update_readme(repo, folders):
    readme_content = "# AIFFEL Online Quests\n\n## Quest List\n\n"
    readme_content += "| 퀘스트명 | URL |\n| --- | --- |\n"

    for folder in folders:
        folder_name = folder['name']
        folder_url = folder['html_url']
        readme_content += f"| {folder_name} | [Link]({folder_url}) |\n"

    with open("README.md", "w") as file:
        file.write(readme_content)


repo = "Kimgabe/AIFFEL_Online_Quest"
folders = get_folders(repo)
update_readme(repo, folders)
