# AIFFEL Campus Online 7th Code Peer Review Templete

- 코더 : 조수민
- 리뷰어 : 이선재



🔑 **PRT(Peer Review Template)**

- [X]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
      답변 :  첨부되었습니다.
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 근거로 첨부
```
# 데이터 전처리 함수
def preprocess_sentence(sentence, remove_stopwords=True):
    sentence = sentence.lower() # 텍스트 소문자화
    sentence = BeautifulSoup(sentence, "lxml").text # <br />, <a href = ...> 등의 html 태그 제거
    sentence = re.sub(r'\([^)]*\)', '', sentence) # 괄호로 닫힌 문자열 (...) 제거 Ex) my husband (and myself!) for => my husband for
    sentence = re.sub('"','', sentence) # 쌍따옴표 " 제거
    sentence = ' '.join([contractions[t] if t in contractions else t for t in sentence.split(" ")]) # 약어 정규화
    sentence = re.sub(r"'s\b","", sentence) # 소유격 제거. Ex) roland's -> roland
    sentence = re.sub("[^a-zA-Z]", " ", sentence) # 영어 외 문자(숫자, 특수문자 등) 공백으로 변환
    sentence = re.sub('[m]{2,}', 'mm', sentence) # m이 3개 이상이면 2개로 변경. Ex) ummmmmmm yeah -> umm yeah
    
    # 불용어 제거 (text)
    if remove_stopwords:
        tokens = ' '.join(word for word in sentence.split() if not word in stopwords.words('english') if len(word) > 1)
    # 불용어 미제거 (headlines)
    else:
        tokens = ' '.join(word for word in sentence.split() if len(word) > 1)
    return tokens
```
[리뷰] 데이터 전처리과정을 빠짐없이 수행하였다.

```
# 훈련 데이터의 손실과 검증 데이터의 손실이 줄어드는 과정을 시각화
plt.plot(history.history['loss'], label='train')
plt.plot(history.history['val_loss'], label='test')
plt.legend()
plt.show()
```
[리뷰] 모델 학습의 결과를 보기 쉽게 시각화까지 진행하였다.

```
for i in range(50, 100):
    print("원문 :", seq2text(encoder_input_test[i]))
    print("실제 요약 :", seq2headlines(decoder_input_test[i]))
    print("예측 요약 :", decode_sequence(encoder_input_test[i].reshape(1, text_max_len)))
    print("\n")

for i in range(0, 10):
    print("원문 :", data3['text'][i])
    print("실제 요약 :", data3['headlines'][i])
    print("추출적 요약 :", recall_summarize(summarize, data3['text'][i], 5))
    print("\n")
```
[리뷰] 예측 결과와 실제 요약문을 비교할 수 있도록 결과를 출력하고 그 뒤에 추출적 요약에 대한 결과까지 출력하였다.

<br>


---    
- [X]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
      답변: 주석이 잘 되어있습니다.
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
```
def preprocess_sentence(sentence, remove_stopwords=True):
    sentence = sentence.lower() # 텍스트 소문자화
    sentence = BeautifulSoup(sentence, "lxml").text # <br />, <a href = ...> 등의 html 태그 제거
    sentence = re.sub(r'\([^)]*\)', '', sentence) # 괄호로 닫힌 문자열 (...) 제거 Ex) my husband (and myself!) for => my husband for
    sentence = re.sub('"','', sentence) # 쌍따옴표 " 제거
    sentence = ' '.join([contractions[t] if t in contractions else t for t in sentence.split(" ")]) # 약어 정규화
    sentence = re.sub(r"'s\b","", sentence) # 소유격 제거. Ex) roland's -> roland
    sentence = re.sub("[^a-zA-Z]", " ", sentence) # 영어 외 문자(숫자, 특수문자 등) 공백으로 변환
    sentence = re.sub('[m]{2,}', 'mm', sentence) # m이 3개 이상이면 2개로 변경. Ex) ummmmmmm yeah -> umm yeah
    
    # 불용어 제거 (text)
    if remove_stopwords:
        tokens = ' '.join(word for word in sentence.split() if not word in stopwords.words('english') if len(word) > 1)
    # 불용어 미제거 (headlines)
    else:
        tokens = ' '.join(word for word in sentence.split() if len(word) > 1)
    return tokens
```
[리뷰] 코드 한 줄 한 줄 주석을 작성하며 해당 코드가 어떤 동작을 하는지 표시하였다.

```
# 어텐션 메커니즘
from tensorflow.keras.layers import AdditiveAttention

# 어텐션 층(어텐션 함수)
attn_layer = AdditiveAttention(name='attention_layer')

# 인코더와 디코더의 모든 time step의 hidden state를 어텐션 층에 전달하고 결과를 리턴
attn_out = attn_layer([decoder_outputs, encoder_outputs])


# 어텐션의 결과와 디코더의 hidden state들을 연결
decoder_concat_input = Concatenate(axis=-1, name='concat_layer')([decoder_outputs, attn_out])

# 디코더의 출력층
decoder_softmax_layer = Dense(tar_vocab, activation='softmax')
decoder_softmax_outputs = decoder_softmax_layer(decoder_concat_input)
```
[리뷰] 주요 코드의 동작에 대해 주석을 작성하여 어텐션 메커니즘에 대해 설명하였다.

<br>

---
        
- [X]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인 또는
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
```
# data2 = pd.read_csv('news_summary_more.csv', encoding='iso-8859-1')
# for idx, text in enumerate(data2['text'][:3]):
#     print(f'<Original_{idx+1}:> \n{text}')
#     print(f'[Summary:] \n{summarize(text, words=20)}\n')

# 데이터 불러오기
data3 = pd.read_csv('news_summary_more.csv', encoding='iso-8859-1')

# 일부 데이터만 사용
for idx, (head, text) in enumerate(zip(data3['headlines'][:3], data3['text'][:3])):
    print(f'<Original_{idx+1}:> \n{text}')
    print(f'[Summary:] \n{summarize(text, words=20)}\n')

# ROUGE 점수 계산
rouge_scores = calculate_rouge_scores(predicted_summary_padded, reference_summary_padded)

# ROUGE 점수 출력
print("ROUGE Scores:", rouge_scores)

Rouge는 일정 길이 이상의 문장이 들어가야 점수 계산이 가능하다. 빈 괄호가 출력되는 이유는 실제 요약과 예측 요약 두 문장의 길이가 짧아서 제대로 출력이 되지 않는 것으로 판단되어 패딩값을 넣어봤는데 그래도 출력이 되지 않는다 😓
```
[리뷰] 새로운 평가 지표를 사용하려고 시도했고 그에 대한 결론이 작성되어 있다.

<br>

---
- [X]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 상세히 기록되어 있는지 확인
    답변: 잘되어있습니다.
        - 딥러닝 모델의 경우,
        인풋이 들어가 최종적으로 아웃풋이 나오기까지의 전체 흐름을 도식화하여 
        모델 아키텍쳐에 대한 이해를 돕고 있는지 확인
```
🤖회고
- Keep :
구글링을 열심히 해보았고 튜토리얼 노드에서 진행했던 코드들을 잘 활용하였다..

- Problem :
작성하면서도 무슨 내용인지 이해가 잘 되지 않는 부분이 많았다..😓  


- Try :
 Rouge score를 사용해보려했다. 시간이 부족해 더 시도해보지 못한 것이 아쉽다.   
 또한 이해가 되지 않는 코드들이지만 일단 사용해보았다..💧
```
[리뷰] KPT 회고가 잘 작성되어있다.

<br>

---
- [X]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 잘 준수하였습니다.
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 모듈화(함수화) 했는지
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
```
# 원문의 정수 시퀀스를 텍스트 시퀀스로 변환
def seq2text(input_seq):
    temp=''
    for i in input_seq:
        if (i!=0):
            temp = temp + src_index_to_word[i]+' '
    return temp

# 요약문의 정수 시퀀스를 텍스트 시퀀스로 변환
def seq2headlines(input_seq):
    temp=''
    for i in input_seq:
        if ((i!=0 and i!=tar_word_to_index['sostoken']) and i!=tar_word_to_index['eostoken']):
            temp = temp + tar_index_to_word[i] + ' '
    return temp
```
[리뷰] 반복적으로 실행해야할 작업을 함수화 작업을 통해 효율적으로 단축시켰다.
       
