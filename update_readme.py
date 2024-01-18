import requests

def get_folders(repo):
    url = f"https://api.github.com/repos/{repo}/contents/"
    response = requests.get(url)
    folders = [item for item in response.json() if item['type'] == 'dir']
    return sorted(folders, key=lambda x: x['name'])

def update_readme(repo, folders):
    # 기존 README.md 내용을 읽기
    with open("README.md", "r") as file:
        original_content = file.read()

    # 표를 추가할 새로운 내용 생성
    new_content = "\n\n## Quest List\n\n"
    new_content += "| 퀘스트명 | URL |\n| --- | --- |\n"

    for folder in folders:
        folder_name = folder['name']
        folder_url = folder['html_url']
        new_content += f"| {folder_name} | [Link]({folder_url}) |\n"

    # 기존 내용과 새로운 내용을 합쳐서 파일에 쓰기
    with open("README.md", "w") as file:
        file.write(original_content + new_content)

repo = "Kimgabe/AIFFEL_Online_Quest"
folders = get_folders(repo)
update_readme(repo, folders)
