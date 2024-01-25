# AIFFEL Campus Online 7th Code Peer Review Templete

- 코더 : 오우진
- 리뷰어 : 김양희


🔑 **PRT(Peer Review Template)**

- [ㅇ]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 근거로 첨부

[리뷰]  
- 루브릭 1 : 공백과 특수문자 처리, 토크나이징, 병렬데이터 구축의 과정이 적절히 진행되었습니다.  
```
# 전처리 함수
def preprocess_sentence(sentence):
    sentence = sentence.strip()  # 양쪽 공백 제거
    sentence = re.sub(r"([?.!,])", r" \1 ", sentence)  # 구두점 분리
    sentence = re.sub(r'[" "]+', " ", sentence)  # 여분의 공백 제거
    sentence = re.sub(r"[^가-힣?.!,]+", " ", sentence)  # 한글, 구두점만 남김
    return sentence
```

```
# SubwordTextEncoder로 토큰화
tokenizer = tfds.deprecated.text.SubwordTextEncoder.build_from_corpus(questions + answers, target_vocab_size=2**13)

# 시작 토큰과 종료 토큰 정의
START_TOKEN, END_TOKEN = [tokenizer.vocab_size], [tokenizer.vocab_size + 1]
```
- 루브릭2 : 구현한 트랜스포머 모델이 한국어 병렬 데이터 학습 시 안정적으로 수렴하였습니다.  


    
- [ㅇ]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.

[리뷰]    
call 함수에서 각 dense에 대해 구체적으로 설명이 되어있습니다.    
```
    # Q, K, V에 각각 Dense를 적용합니다
    query = self.query_dense(query)  # Query에 Dense 적용
    key = self.key_dense(key)        # Key에 Dense 적용
    value = self.value_dense(value)  # Value에 Dense 적용
```
        
- [ㅇ]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인 또는
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.

[리뷰]      
에러가 난 부분이 없이 정상적으로 잘 작동하였습니다.    
        
- [d]  **4. 회고를 잘 작성했나요?** 
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 상세히 기록되어 있는지 확인
        - 딥러닝 모델의 경우,
        인풋이 들어가 최종적으로 아웃풋이 나오기까지의 전체 흐름을 도식화하여 
        모델 아키텍쳐에 대한 이해를 돕고 있는지 확인

[리뷰] 회고에서 학습한 내용을 어떻게 적용해볼지를 확인할 수 있습니다.    
이 프로젝트는 딥러닝과 NLP의 실제 적용 사례를 경험할 수 있는 기회였으며. 코드를 작성하며 얻은 지식과 경험은 향후 유사한 프로젝트나 다른 기계 학습 작업에 큰 도움이 될 것같습니다. 데이터 전처리부터 모델 구축, 최적화, 평가에 이르기까지 다양한 단계에서 중요한 교훈을 얻었습니다.  

- []  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 모듈화(함수화) 했는지
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.

[리뷰]    
class를 활용하여 간결하고 효율적이게 작성하였습니다.     
```
class CustomSchedule(tf.keras.optimizers.schedules.LearningRateSchedule):

  def __init__(self, d_model, warmup_steps=4000):
    super(CustomSchedule, self).__init__()

    self.d_model = d_model
    self.d_model = tf.cast(self.d_model, tf.float32)

    self.warmup_steps = warmup_steps

  def __call__(self, step):
    arg1 = tf.math.rsqrt(step)
    arg2 = step * (self.warmup_steps**-1.5)

    return tf.math.rsqrt(self.d_model) * tf.math.minimum(arg1, arg2)
```


