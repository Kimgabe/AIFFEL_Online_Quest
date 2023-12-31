# AIFFEL Campus Online 7th Code Peer Review Templete

- 코더 : 김민기
- 리뷰어 : 김승순

🔑 **PRT(Peer Review Template)**

- [✔️]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 근거로 첨부

👉 프로젝트: 새로운 데이터셋으로 나만의 이미지 분류기 만들어보기라고 프로젝트 내용을 명시하였음
👉 주어진 문제에 대해 풀이하는 코드들만 간결하게 정리하여 작성하였음
    
- [✔️]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.

- [✔️]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인 또는
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
👉 해당 내용이 회고 부분에 잘 작성이 되어 있음

![image](https://github.com/Kimgabe/AIFFEL_Online_Quest_KMK/assets/74717033/b5bb5924-dabf-4f11-b45b-625a413c267e)

- [✔️]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 상세히 기록되어 있는지 확인
        - 딥러닝 모델의 경우,
        인풋이 들어가 최종적으로 아웃풋이 나오기까지의 전체 흐름을 도식화하여 
        모델 아키텍쳐에 대한 이해를 돕고 있는지 확인

👉 실험하며 변경된 내용들에 대해서 간결하게 기록하였음
👉 특히, 문제해결과정에서 어떤 문제들이 발생하고 해결했는지를 작성하였음

- [✔️]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 모듈화(함수화) 했는지
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.

👉 매우 효율적이고 간결해서 이해가 쉬웠습니다. 특히 Transfer Learning할 모델 리스트 확인해서 선택한 부분이 좋았습니다.
```python
dir(tf.keras.applications)

IMG_SHAPE = (IMG_SIZE, IMG_SIZE, 3)

# VGG19으로 선정 / fully-connected layer는 제외
base_model = tf.keras.applications.MobileNet(input_shape=IMG_SHAPE,
                                             include_top=False,
                                             weights='imagenet')
```

# 참고 링크 및 코드 개선
```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
