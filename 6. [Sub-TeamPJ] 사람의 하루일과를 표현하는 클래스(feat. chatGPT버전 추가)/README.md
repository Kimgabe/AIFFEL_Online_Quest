## AIFFEL 파이썬 프로그래밍 팀별 프로젝트를 위한 레포지토리 입니다.
- Quset : 파이썬 프로그래밍을 이용하여 '사람'을 구현하기
- 기한 : 2023.11.10~19
- 참여인원 : 6명
- 제한 조건 :
   1) 파이썬 프로그래밍에서 배운 기초 개념을 사용할것
   2) 클래스와 함수를 이용해서 구현할 것

---
## 프로그래밍 설명
- 파이썬 프로그래밍에서 배운 다양한 기능을 활용하여 Person이라는 클래스를 만들고 한 사람의 프로필 정보를 입력 받고 하루 일과를 표현하는 프로그램 만드는 것이 목표입니다.
- input을 활용해 대화형으로 프로필 및 하루 루틴 정보를 입력받아 객체로 생성했고 생성된 프로필 및 루틴 정보를 활용해 아침, 점심, 저녁 시간대별 일과에 대해 서술하도록 했습니다.

### 세부 설정사항 설명
- 기본적으로 대화형 입/출력을 하기 위해 input() 함수를 사용했습니다.
- 가급적이면 입력 옵션에 대한 예시를 제공해 원하는 입력형태로 입력되도록 가이드하도록 했습니다.
- 타이핑을 직접하는일을 최소화 하고자 가급적 숫자로 답변을 입력받고 조건문으로 처리했습니다.
- 몇몇 질문에는 AIFFEL 퍼실&그루님들이라면 피식~🙃 할 수 있는 몇가지 질문 요소를 넣어봤습니다.
- 최종 출력물은 Simple ver과 Fancy Ver이 있습니다.
- 두가지를 다 시도해보는 것도 일종의 재미요소로 남겨놨습니다.

---
  
## 클래스 구조
- Profile : 기본적인 프로필을 입력받는 클래스
   - 하위 메서드
      - set_profile : 모든 프로필 정보를 입력받는 메서드
         - profile_img : 프로필 이미지를 입력받는 메서드
         - set_mbti : mbti를 입력받는 메서드
         - set_others : 나머지 모든 정보(이름, 나이, 성별, 거주지, 관심사,..etc)를 입력받는 메서드
      - display_info : 입력받은 정보들을 출력하는 메서드
- Routine : 위에 입력받은 프로필의 대상에 대한 하루 일과를 입력받는 클래스
   - daily_routine : 아침, 점심, 저녁 순으로 작동하며 사전에 정의해둔 일과 분류에 따라 일과 유형을 구분하고, 상세 내용을 직접 입력할 수 있는 메서드
   - print_routine : 입력받은 일과정보를 아침, 점심, 저녁으로 사전에 구분된 카테고리별로 구분하여 출력하는 메서드

### 클래스 구조 변천과정
- 처음에는 Person이라는 클래스 하나를 만들고 모든 기능을 메서드로 넣으려고했습니다.
- 팀을 나눠서 작성하다보니 코드가 상당히 길어졌고, 들여쓰기가 제각각이라 클래스 선언에서 에러가 발생하는 경우도 발생했습니다.
  - 특히나, 코렙과 로컬의 주피터 또는 vs code를 오가는 과정에서 조금씩의 들여쓰기 변동이 일어나기도 해서 애를 먹었습니다.
- 해결을 위해 각각 작업한 클래스를 기능 특성에 맞춰 각각 Profile, Routine 이란 클래스로 변경하였습니다.
- 이후 Person이라는 자식 Class를 만들어 앞의 두 부모 클래스의 모든 기능을 이어받아 수집된 정보를 출력하는 메서드를 추가했습니다.
- 궁여지책으로 생각해낸 방법이지만, 결과적으론 효율적인 방법의 작업이 아니었나 싶어서 왜 처음부터 이 생각을 못했나 싶었습니다.
- 결론적으로는 코드가 처음 구상보다 보기좋게 정리된 것 같아 다행이라 생각합니다.

---

## ✔️ Update Log
- 23.11.11 : 브레인스토밍 진행(프로그램 컨셉) 및 프로젝트 진행을 위한 자료 공유(by GitHub)
- 23.11.14 : 사람 프로필 생성 항목 및 클래스 컨셉 논의
- 23.11.16 : 컨셉확정 및 팀 분할, 1차 작업 진행
   - 프로필 클래스 생성 팀 : 김승순, 강영현, 이선재
   - 하루일과(루틴) 클래스 생성 팀 : 이슬, 오우진, 한현종
   - 진행 작업 내역
      - 전체 클래스 구조 설정([공동 작업용 엑셀파일 공유](https://docs.google.com/spreadsheets/d/1IuqOQzyD3fWNC_9nZqND9q53pbf5zZPXJbMfx5ffCeI/edit?usp=sharing))
      - 프로필 항목 아이디어 회의
      - 프로필 입력 및 예외처리 부문 논의
      - 프로필명 별 메서드 작성 파트 분배
      - 개별 메서드 작성
- 23.11.18 : 팀별 클래스 생성 결과 공유 및 병합, 세부사항 수정 등 2차 작업 진행
   - 개별 작성 코드 검토 및 구동 확인
   - 개별 프로필 출력결과 확인 및 오류내용 수정
   - 결과 출력용 child 클래스 생성 및 출력 결과물 확인
   - github 결과물 업로드 및 코드 공유
- 23.11.19 : 최종 마무리 & 프로젝트 인원별 회고 작성 및 최종 제출
   - 일부 코드 가독성 up 및 출력결과 조정 수정

---

## 팀 회고

### 김승순
### KEEP
- [python] 최대한 배운 개념을 이용해서 구현하려고 계획을 짰던 것
- [python] 중간쯤 시작했지만 구조를 그려두고 체계를 잡아간 것 + 길어진 코드를 억지로 수정하려하지 않고 child Class응용해서 마무리한 것
- [python] 구글링을 최대한 활용해서 막히는 부분들을 하나씩 풀어 냈던 것(몇년동안 쌓아둔 북마크가 한몫 했다.)
- [팀플] 원활한 진행을 위해 사전 준비를 많이 한것(PROBLEM이 되기도 한듯)
- [팀플] 기한내 완수를 위해 역할분배를 하려고 시도한 것(잘되었는지는 별개로)

### PROBLEM
- [python]머리속에 구상은 잘 떠오르는데 구현이 안된다. 어디서 본건 많아서 생각은 잘나는데, 막상 하는 방법을 잘 못만든다.
- [python] 처음부터 하위 메서드 합치려고 할때 체계를 잘 고려해야했는데, 작성에만 초점을 맞춰서 indent error로 수정하느라 불필요한 시간을 많이 소모했음
- [python] 작업 효율을 위해서 set_others안에 여러 input을 받는 방식으로 구성했는데, 생각해보니 코드의 수정 보완을 위해서는 개별 메서드로 하는것이 더 직관적이지 않았을까 싶다. 덕분에 생성자에서 코드를 구성하는 부분에서는 심플하게 시작할 수 있었지만 개별 기능을 수정하는건 차후에 더 찾기 어렵지 않을까? 싶었다.
- [팀플] '팀플' 이라는걸 고려하면 좀 더 팀장으로서 다양한 역할 배분이나 의견 고려를 했어야 하지 않나 하는 생각이든다. 기한내 완성에 목표를 두다보니 조급해서인지 혼자 준비를 왕창해놓고 밀어 붙인면이 좀 있는듯
- [팀플] 체계적으로 관리해보려고 깃헙에 README에 ✔️ Update Log도 만들고, 엑셀로 클래스랑 메서드 구조도 잡아서 공유하고 했는데, 정작 활용은 1~2번 정도하고, 마무리 다하고 몰아서 작성했다.(시도는 나쁘지 않았는데 시간에 쪼들리니까 쓸 생각도 못했다..)

### TRY
- [python] 아직은 더 많은 코드들을 보고 따라해볼 시간이 필요한것 같다. 구상을 자체적으로 구현화 하는 코딩 실력이 필요하다. 다른 수가 없다이건, 많이 쳐보는 수밖에!
- [팀플] 팀원들 의견/상황을 더 고려하면서 작업하기, 당장 뭘 해내려고 모인게 아니라 같이 배우고 같이 성장하려고 모였다는걸 잊지 말것!


---
## 강영현
### KEEP
- [python] 미숙한 코딩 실력으로 주어진 역할을 수행하기 위해 머리속으로 구상을 하고 프로그래밍해본 것
- [python] 구상한 코드에서 좀 더 활용해보려고 구글링하고 찾아본 것(localtime()함수를 이용해 보고 싶었다.)
- [팀플] 다른 팀원들에 비하면 아직 부족한 역량이지만, 내 몫을 해보려고 노력한 것
### PROBLEM
- [python] 새로운 코드를 구상해봤는데, 실행은 못 해 봤다. 나중에 시간을 내서 내가 프로그래밍한 부분만 다시 시도해봐야겠다.
- [python] 아직 팀원들이 열심히 프로그래밍한 코드를 다 이해하지는 못 한다는 것
- [팀플] 처음에 팀플 시작할 때, 적극적으로 참여하지 못 한 것
### TRY
- [pyhton] 구현해보지 못 한 내 몫을 다시 프로그래밍해볼 것(localtime()함수 이용해서 해보기)
- [팀플] 다음 팀플 때는 더 적극적인 자세로 임하자.
---
## 이선재
### KEEP
- [python] 학습한 개념을 최대한 다양하게활용하려 노력했다.
- [python] 어떠한 문제에 직면했을 때 혼자 해결하려 고집부릳지 않고 팀원들에게 질문, 구글링을 시기적절하게 활용했다.
- [팀플] 회의를 함에 있어서 적극적으로 참여했다.
- [팀플] 팀원들과의 역할 분배를 통해 가능한 많은 분량을 해내려고 노력했다.
### PROBLEM
- [python] 예외처리를 하는 과정에서 코드가 많이 지저분해졌다.
- [python] 더 효율적인 코드를 구성하는 능력이 부족한 것 같다.
- [팀플] 내 역할에 집중을 하게되면 귀가 닫혀 어쩌면 팀원들로 하여금 소통이 잘 안된다고 느껴졌을 것 같다.
- [팀플] 팀장 및 팀원 그루님들이 열심히 하시는데 끝까지 함께하지 못했다. 
### TRY
- [python] 파이썬을 반복 학습하며 어떻게 코딩을 하면 더 효율적인 코드가 나올지 연구해볼 것
- [팀플] 간단한 과제라도 계획을 세우고 시작을 하여 팀원들과 더욱 협업할 수 있도록 노력할 것

---
## 이슬
### KEEP
- [python] 클래스 노드에서 배운 개념을 최대한 활용해서 코드를 만들려고 시도했다.
- [팀플 ] 마지막까지 전체 코드의 완성도를 높이기 위해 조원들과 함께 최선을 다했다.
  
### PROBLEM
- [python] 호출할때 키와 값이 쌍으로 된 딕셔너리가 편하다고 생각하고 딕셔너리안에 딕셔너리를 만들어서 데이터를 쌓이도록 만들었는데, 출력되는 결과는 깔끔해 보일수 있지만 값을 호출할때는 코드를 복잡하게 하는 문제가 생겼다.
- [팀플] 팀을 나누어 총 2개의 메서드를 구현했는데 코드를 완성하는데 시간이 부족하다 보니 우리 팀에서 만든 메서드의 기능이 빈약하지 않을까 혼자 판단하고 팀원들과 함께 짜두었던 코드를 전면 수정했다. 물론 주말 일정이 맞지 않아서 함께 작업할수 없는 상황이긴 했지만, 처음부터 신중하게 기능이나 구조에 대한 논의를 나누었으면 어땠을까 하는 생각이 든다.
- [팀플] 복잡한 형태의 프로그래밍을 팀으로 하는게 처음이었고, 꽤 많은 기능과 코드라인들이 합쳐졌는데 과정에서 변수나 들여쓰기를 맞춰가며 작업하는게 어려운걸 알게되었다.
  
### TRY
- [python] 함수에서 출력뿐 아니라 값을 호출하는 과정도 염두하고 구조를 만든다.
- [python] 'nested dictionary'라는 개념에 대해 추가로 공부해본다.
- [팀플] 변수나 함수 등은 만들때마다 엑셀시트에 이름, 가져오는 값, 역할, 다른 변수/함수와의 관계에 대해 간단히 정리해두는 연습을 해본다.

---
## 오우진
### KEEP
### PROBLEM
### TRY

---
## 한현종
### KEEP
### PROBLEM
### TRY

---

    

