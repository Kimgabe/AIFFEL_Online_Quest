# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 홍채림
- 리뷰어 : 이선재

🔑 **PRT(Peer Review Template)**

- [X]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 근거로 첨부

* 루브릭 1
<img width="887" alt="스크린샷 2024-01-25 오후 5 25 55" src="https://github.com/thetjswo/AIFFEL_Online_Quest_Cherry_hcl/assets/74177040/37896b3a-b6a3-4eec-af5e-138771aefc6d">
```
    import re
    
    def preprocess_sentence(sentence):
        # 입력받은 문장을 소문자로 변경하고 양쪽 공백을 제거
        sentence = sentence.lower().strip()
    
        # 한글, 문장부호를 제외한 모든 문자를 공백으로 대체
        sentence = re.sub(r"[^가-힣?.!,ㅠㅎㅋ]+", " ", sentence)
    
        # 문장부호 앞뒤에 공백 추가
        sentence = re.sub(r"([?.!,])", r" \1 ", sentence)
    
        # 연속된 공백은 하나의 공백으로
        sentence = re.sub(r'[" "]+', " ", sentence)
    
        sentence = sentence.strip()
        return sentence
    
    # 테스트
    print(preprocess_sentence("안녕하세요? 저는 챗봇입니다!!"))
    
    import pandas as pd
    
    def load_conversations():
        # 데이터셋 로드
        df = pd.read_csv(file_path)
        
        # 질문과 답변 쌍
        questions, answers = [], []
        for i in range(len(df)):
            # 전처리 함수를 적용
            questions.append(preprocess_sentence(df['Q'][i]))
            answers.append(preprocess_sentence(df['A'][i]))
    
            if len(questions) >= MAX_SAMPLES:
                break
        return questions, answers
    
    # 데이터를 로드하고 전처리하여 질문을 questions, 답변을 answers에 저장합니다.
    
    questions, answers = load_conversations()
    
    print('전체 샘플 수 :', len(questions))
    
    print('전체 샘플 수 :', len(answers))

    # 5번째 샘플 출력으로 확인
    print(questions[5])
    print(answers[5])
```

[리뷰] 전처리 과정이 이해하기 쉽게 작성이 되었다.  

* 루브릭 2
```
    Epoch 1/20
    185/185 [==============================] - 21s 74ms/step - loss: 1.0460 - accuracy: 0.0171
    Epoch 2/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.8508 - accuracy: 0.0354
    Epoch 3/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.7244 - accuracy: 0.0365
    Epoch 4/20
    185/185 [==============================] - 14s 73ms/step - loss: 0.6689 - accuracy: 0.0391
    Epoch 5/20
    185/185 [==============================] - 14s 73ms/step - loss: 0.6271 - accuracy: 0.0416
    Epoch 6/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.5838 - accuracy: 0.0447
    Epoch 7/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.5358 - accuracy: 0.0491
    Epoch 8/20
    185/185 [==============================] - 14s 73ms/step - loss: 0.4832 - accuracy: 0.0549
    Epoch 9/20
    185/185 [==============================] - 14s 73ms/step - loss: 0.4269 - accuracy: 0.0608
    Epoch 10/20
    185/185 [==============================] - 14s 73ms/step - loss: 0.3673 - accuracy: 0.0677
    Epoch 11/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.3071 - accuracy: 0.0751
    Epoch 12/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.2496 - accuracy: 0.0829
    Epoch 13/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.1958 - accuracy: 0.0907
    Epoch 14/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.1494 - accuracy: 0.0977
    Epoch 15/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.1097 - accuracy: 0.1046
    Epoch 16/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.0797 - accuracy: 0.1103
    Epoch 17/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.0572 - accuracy: 0.1146
    Epoch 18/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.0450 - accuracy: 0.1166
    Epoch 19/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.0374 - accuracy: 0.1179
    Epoch 20/20
    185/185 [==============================] - 14s 74ms/step - loss: 0.0323 - accuracy: 0.1188
```
[리뷰] accuracy가 점진적으로 상승하고, loss가 일정하게 하강하는 형태를 확인할 수 있었다.  


* 루브릭 3
```
    def sentence_generation(sentence):
      # 입력 문장에 대해서 디코더를 동작 시켜 예측된 정수 시퀀스를 리턴받습니다.
      prediction = decoder_inference(sentence)
    
      # 정수 시퀀스를 다시 텍스트 시퀀스로 변환합니다.
      predicted_sentence = tokenizer.decode(
          [i for i in prediction if i < tokenizer.vocab_size])
    
      print('입력 : {}'.format(sentence))
      print('출력 : {}'.format(predicted_sentence))
    
      return predicted_sentence
```

<img width="986" alt="스크린샷 2024-01-25 오후 5 28 37" src="https://github.com/thetjswo/AIFFEL_Online_Quest_Cherry_hcl/assets/74177040/77664aef-de5b-4ed1-81d8-f71b22e53319">
[리뷰] 질문자가 상처를 받을 것 같은 말을 골라서 하는 성격의 챗봇인 것 같다...  

---
    
- [X]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.

<img width="971" alt="스크린샷 2024-01-25 오후 5 29 32" src="https://github.com/thetjswo/AIFFEL_Online_Quest_Cherry_hcl/assets/74177040/24a1aa9a-a00f-405d-ac6c-cc7fa9c92cf6">
[리뷰] 코드만 보면 이해를 못할 정도로 복잡한 내용이라 판단이 되는데 자세한 설명과 함께 이미지를 첨부하여 그 구조에 대해 이해하기 훨씬 수월했다.  

---
        
- [X]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인 또는
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.

<img width="982" alt="스크린샷 2024-01-25 오후 5 29 54" src="https://github.com/thetjswo/AIFFEL_Online_Quest_Cherry_hcl/assets/74177040/64ea374c-2210-4773-9c01-99c2cd79d8c9">
[리뷰] 노드에서는 그래프를 너무 작게 시각화하여 이게 도대체 무슨 그래프인가 싶었는데, 그래프의 크기를 확장하여 단어와 차원 간의 관계를 확인하기 수월하였다.  

---

- [X]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 상세히 기록되어 있는지 확인
        - 딥러닝 모델의 경우,
        인풋이 들어가 최종적으로 아웃풋이 나오기까지의 전체 흐름을 도식화하여 
        모델 아키텍쳐에 대한 이해를 돕고 있는지 확인

<img width="894" alt="스크린샷 2024-01-25 오후 5 50 30" src="https://github.com/thetjswo/AIFFEL_Online_Quest_Cherry_hcl/assets/74177040/6a6b8d33-657c-4bed-85a4-9525d0619dd3">
[리뷰] 개선 전후에 대한 비교와 심경이 잘 작성되었다.

---
        
- [X]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 모듈화(함수화) 했는지
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
```
     # num_layers만큼 쌓아올린 인코더의 층.
      for i in range(num_layers):
        outputs = encoder_layer(
            units=units,
            d_model=d_model,
            num_heads=num_heads,
            dropout=dropout,
            name="encoder_layer_{}".format(i),
        )([outputs, padding_mask])
    
    # 디코더 레이어를 num_layers만큼 쌓습니다.
        for i in range(num_layers):
            outputs = decoder_layer(
                units=units,
                d_model=d_model,
                num_heads=num_heads,
                dropout=dropout,
                name='decoder_layer_{}'.format(i),
            )(inputs=[outputs, enc_outputs, look_ahead_mask, padding_mask])
```

[리뷰] 여러 번 반복해야하는 코드를 반복문을 사용하여 깔끔하게 정리하였다.  

---

리뷰: 각 함수에 대한 설명이 자세하게 기록되어 있고, 개선 전후의 비교를 통해 개선된 사항을 알 수 있었다.

