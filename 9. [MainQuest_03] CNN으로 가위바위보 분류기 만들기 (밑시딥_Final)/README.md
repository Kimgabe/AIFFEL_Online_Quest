## 📌 퀘스트소개
---

- 12월 초부터 약 2주동안 딥러닝의 기초에 대해 배우고 밑바닥 부터 배우는 딥러닝 책으로 CNN을 구현하는 과정을 학습했습니다.
- 이 과정의 마지막 퀘스트로 가위, 바위, 보 사진을 학습하고 분류하는 CNN기반의 이미지 분류기를 만드는 퀘스트를 진행하였습니다.

---
### 퀘스트 당일
- 생각보다 퀘스트 자체에 필요한 코드가 어려운 것은 아니었지만, 파일들을 병합하고 하나의 폴더에서 처리하는 등의 전처리 과정을 자동화 하려고 하다가 많은 시간을 소모했습니다.
- 그 외에 다양한 오버피팅 기법을 적용해보려 했으나 이를 시간내에 제대로 수행하지 못했고 목표 정확도인 85%에 미치지 못했습니다.
  
### ✔️ 재도전
- 이에 주말동안 공부를 하여 추가적인 시도를 통해 목표 점수를 넘는 것을 목표로 다양한 시도를 하였습니다.
- 최초의 학습데이터로 사용한 스스로 생성한 300개의 데이터에 대해 다양한 오버피팅 방지를 위한 기법들(드롭아웃, L2규제, 데이터 증강 등)을 시도했지만 큰 성과는 없었습니다.
- 이에 동료그루들이 생성해준 이미지 데이터들을 추가해 약 7500개의 이미지로 학습을 수행했더니 획기적인 모델 성능의 향상이 이뤄졌습니다.
  - 데이터 추가만으로 90%대의 정확도를 달성했습니다.
- 다만, 테스트 모델의 정확도가 100%라 약간의 과적합이 의심되어 학습데이터(추가된 7500개)와 기존 테스트데이터를 합치고 8:2로 재분배하여 모델 학습을 진행했습니다.
- 이후 모델 성능 향상을 위해 데이터 증강을 시도 하여 약 1%의 성능 향상에 성공하였습니다.
- 이후에는 베이지안최적화를 통해 하이퍼 파라미터 튜닝을 시도하였고, 그 결과 99.7%의 정확도를 보유한 모델을 생성할 수 있었습니다.

![reaal_time_detection](https://github.com/Kimgabe/AIFFEL_Online_Quest/assets/74717033/626f4f6a-1745-4f01-92ea-0b8c2a0b42e4)
