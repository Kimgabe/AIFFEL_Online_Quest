# 💡 파일 용량이 너무 커서 깃허브에서 직접 확인이 어렵습니다.
- pdf와 html을 첨부했습니다. 코드북(.ipynb)를 다운받아 로컬에서 vs code 등으로 보시는걸 권장드립니다.

---
# AIFFEL Campus Online 7th Code Peer Review Templete

- 코더 : 김승순
- 리뷰어 : 김민기



🔑 **PRT(Peer Review Template)**

- [x]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 근거로 첨부
        - 
![image](https://github.com/NeatyNut/AIFFEL_Online_Quest_Kimgabe/assets/89675001/75d34780-b685-4ee1-95d8-c1cae05d4f10)

- MobileNetV2로 90% 이상의 accuracy를 달성한 모습
          

- [x]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
         

![image](https://github.com/NeatyNut/AIFFEL_Online_Quest_Kimgabe/assets/89675001/6fe50d2c-88d4-489b-af09-d062dcdf053e)

- 데이터 불균형에 관한 코드인데 각주가 달려 알아보기 쉬웠다.


- [x]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인 또는
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
     
![image](https://github.com/NeatyNut/AIFFEL_Online_Quest_Kimgabe/assets/89675001/773bbded-1cff-4c11-8461-bd4313d4bd2f)

- ResNet50의 정확도가 오르지 않아 데이터 불균형 처리를 위한 데이터 증강, Fine Tunning 대상 레이어 확장, 앙상블 기법을 쓰는 등 다양한 기법들을 사용하였다.

      

- [x]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 상세히 기록되어 있는지 확인
        - 딥러닝 모델의 경우,
        인풋이 들어가 최종적으로 아웃풋이 나오기까지의 전체 흐름을 도식화하여 
        모델 아키텍쳐에 대한 이해를 돕고 있는지 확인

![image](https://github.com/NeatyNut/AIFFEL_Online_Quest_Kimgabe/assets/89675001/d0eeafed-5b1d-470d-a47e-e94280d2b44b)

- 여러가지 시도에 대한 문제점과 개선방향을 잘 언급해주었습니다.(데이터 증강)

- [x]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 모듈화(함수화) 했는지
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.

![image](https://github.com/NeatyNut/AIFFEL_Online_Quest_Kimgabe/assets/89675001/96e9dbad-6d3e-4792-8e4a-49842d6830bf)

- 앙상블 기법을 구현할 때 평균을 써서 구현하는 것을 간결한 코드로 확인할 수 있었다. 
