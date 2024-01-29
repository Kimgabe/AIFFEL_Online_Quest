퀘스트 README.md

- 코더 : 오우진
- 리뷰어 : 이선재


🔑 **PRT(Peer Review Template)**

- [X]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 근거로 첨부
```
model = tf.keras.Sequential([
    tf.keras.applications.MobileNetV2(input_shape=(IMG_SIZE, IMG_SIZE, 3), include_top=False),
    tf.keras.layers.GlobalAveragePooling2D(),
    tf.keras.layers.Dense(5, activation='softmax')
])
```
* pre-trained된 MobileNetV2를 이용하여 transfer learning을 잘 수행하였다.

```
# 학습 과정 시각화
import matplotlib.pyplot as plt

def plot_accuracy_loss(history):
    accuracy = history.history['accuracy']
    val_accuracy = history.history['val_accuracy']
    loss = history.history['loss']
    val_loss = history.history['val_loss']

    plt.figure(figsize=(12, 4))
    plt.subplot(1, 2, 1)
    plt.plot(accuracy, label='Training Accuracy')
    plt.plot(val_accuracy, label='Validation Accuracy')
    plt.legend(loc='lower right')
    plt.title('Training and Validation Accuracy')
    plt.xlabel('Epochs')
    plt.ylabel('Accuracy')

    plt.subplot(1, 2, 2)
    plt.plot(loss, label='Training Loss')
    plt.plot(val_loss, label='Validation Loss')
    plt.legend(loc='upper right')
    plt.title('Training and Validation Loss')
    plt.xlabel('Epochs')
    plt.ylabel('Loss')

    plt.show()

# 정확도와 손실 값을 그래프로 출력합니다.
plot_accuracy_loss(history)

# 검증 데이터셋에서의 손실과 정확도를 평가합니다.
loss, accuracy = model.evaluate(validation_batches)
print("Validation Loss: {:.2f}".format(loss))
print("Validation Accuracy: {:.2f}%".format(accuracy * 100))

# 테스트 데이터셋에서의 손실과 정확도를 평가합니다.
loss, accuracy = model.evaluate(test_batches)
print("Test Loss: {:.2f}".format(loss))
print("Test Accuracy: {:.2f}%".format(accuracy * 100))
```
* 학습과 검증에 대한 정확도와 손실값에 대한 그래프를 그려 그 차이를 확인할 수 있게 하였다.

```
# 이미지, 라벨, 예측값을 시각화하는 함수
def visualize_images(images, labels, predictions):
    class_names = ['daisy', 'dandelion', 'roses', 'sunflowers', 'tulips']
    num_images = len(images)

    # 이미지 개수에 따라 적절한 행과 열을 계산합니다.
    rows = int(np.ceil(np.sqrt(num_images)))
    cols = int(np.ceil(num_images / rows))

    plt.figure(figsize=(15, 10))
    for i in range(num_images):
        plt.subplot(rows, cols, i + 1)
        plt.xticks([])
        plt.yticks([])
        plt.grid(False)
        plt.imshow(images[i])
        predicted_label = np.argmax(predictions[i])
        true_label = labels[i]
        if predicted_label == true_label:
            color = 'green'
        else:
            color = 'red'
        plt.xlabel("Predicted: {} ({})".format(class_names[predicted_label], 
                                                class_names[true_label]), color=color)

    plt.tight_layout()
    plt.show()

# 이미지, 라벨, 예측값을 가져옵니다.
images = image_batch.numpy()
labels = true_labels

# 시각화 함수를 호출하여 이미지, 라벨, 예측값을 시각화합니다.
visualize_images(images, labels, predictions)
```
* 각 평가 이미지 별로 분류 성공 여부를 시각화하고 정확도를 출력하여 평가 데이터의 정확도를 알 수 있게 하였다.
    
- [X]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
```
# 데이터 전처리를 위한 함수입니다.
def tf_format_example(data):
    # 이미지를 float32 자료형으로 변환합니다.
    image = tf.cast(data['image'], tf.float32)
    # 이미지를 0~1 사이의 값으로 정규화합니다.
    image = (image/255.0)
    # 이미지 크기를 IMG_SIZE로 조정합니다.
    image = tf.image.resize(image, (IMG_SIZE, IMG_SIZE))
    # 라벨을 가져옵니다.
    label = data['label']
    return image, label

# 데이터셋을 로드합니다. 이번에는 전체 데이터셋을 로드합니다.
dataset, info = tfds.load('tf_flowers', split='train', with_info=True)

# tf_format_example 함수를 이용하여 데이터셋을 전처리합니다.
dataset = dataset.map(tf_format_example)

# 전체 데이터셋의 크기를 확인합니다.
num_examples = info.splits['train'].num_examples
# 훈련 데이터셋의 크기를 계산합니다.
train_size = int(0.8 * num_examples)
# 검증 데이터셋의 크기를 계산합니다.
val_size = int(0.1 * num_examples)
# 테스트 데이터셋의 크기를 계산합니다.
test_size = num_examples - train_size - val_size

# 훈련 데이터셋을 생성합니다.
train_dataset = dataset.take(train_size)
# 남은 데이터셋에서 검증 데이터셋을 생성합니다.
remaining_dataset = dataset.skip(train_size)
validation_dataset = remaining_dataset.take(val_size)
# 남은 데이터셋에서 테스트 데이터셋을 생성합니다.
test_dataset = remaining_dataset.skip(val_size)

# 데이터 증강을 위한 함수입니다.
def tf_augment_example(image, label):
    # 무작위로 좌우로 뒤집기
    image = tf.image.random_flip_left_right(image)
    return image, label

# 데이터셋에 데이터 증강 함수를 적용합니다.
train_dataset = train_dataset.map(tf_augment_example)

# 훈련 데이터셋을 섞고 배치 단위로 나눕니다.
train_batches = train_dataset.shuffle(100).batch(32)
# 검증 데이터셋을 배치 단위로 나눕니다.
validation_batches = validation_dataset.batch(32)
# 테스트 데이터셋을 배치 단위로 나눕니다.
test_batches = test_dataset.batch(32)
```
* 가장 까다로운 전처리 부분에 대하여 모든 코드에 주석을 달아 코드를 이해하기 쉽게끔 작성하였다.
        
- [X]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인 또는
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
```
# tf_format_example 함수를 이용하여 데이터셋을 전처리합니다.
dataset = dataset.map(tf_format_example)

# 전체 데이터셋의 크기를 확인합니다.
num_examples = info.splits['train'].num_examples
# 훈련 데이터셋의 크기를 계산합니다.
train_size = int(0.8 * num_examples)
# 검증 데이터셋의 크기를 계산합니다.
val_size = int(0.1 * num_examples)
# 테스트 데이터셋의 크기를 계산합니다.
test_size = num_examples - train_size - val_size

# 훈련 데이터셋을 생성합니다.
train_dataset = dataset.take(train_size)
# 남은 데이터셋에서 검증 데이터셋을 생성합니다.
remaining_dataset = dataset.skip(train_size)
validation_dataset = remaining_dataset.take(val_size)
# 남은 데이터셋에서 테스트 데이터셋을 생성합니다.
test_dataset = remaining_dataset.skip(val_size)

# 데이터 증강을 위한 함수입니다.
def tf_augment_example(image, label):
    # 무작위로 좌우로 뒤집기
    image = tf.image.random_flip_left_right(image)
    return image, label

# 데이터셋에 데이터 증강 함수를 적용합니다.
train_dataset = train_dataset.map(tf_augment_example)
```
* 데이터를 나누는 과정에서 기존에 연습하던 방법이 아닌 새로운 방법으로 시도를 하였다.
        
- [ ]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 상세히 기록되어 있는지 확인
        - 딥러닝 모델의 경우,
        인풋이 들어가 최종적으로 아웃풋이 나오기까지의 전체 흐름을 도식화하여 
        모델 아키텍쳐에 대한 이해를 돕고 있는지 확인

- [X]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 모듈화(함수화) 했는지
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
```
# 데이터 전처리를 위한 함수입니다.
def tf_format_example(data):
    # 이미지를 float32 자료형으로 변환합니다.
    image = tf.cast(data['image'], tf.float32)
    # 이미지를 0~1 사이의 값으로 정규화합니다.
    image = (image/255.0)
    # 이미지 크기를 IMG_SIZE로 조정합니다.
    image = tf.image.resize(image, (IMG_SIZE, IMG_SIZE))
    # 라벨을 가져옵니다.
    label = data['label']
    return image, label

def tf_augment_example(image, label):
    # 무작위로 좌우로 뒤집기
    image = tf.image.random_flip_left_right(image)
    return image, label

def plot_accuracy_loss(history):
    accuracy = history.history['accuracy']
    val_accuracy = history.history['val_accuracy']
    loss = history.history['loss']
    val_loss = history.history['val_loss']

    plt.figure(figsize=(12, 4))
    plt.subplot(1, 2, 1)
    plt.plot(accuracy, label='Training Accuracy')
    plt.plot(val_accuracy, label='Validation Accuracy')
    plt.legend(loc='lower right')
    plt.title('Training and Validation Accuracy')
    plt.xlabel('Epochs')
    plt.ylabel('Accuracy')

    plt.subplot(1, 2, 2)
    plt.plot(loss, label='Training Loss')
    plt.plot(val_loss, label='Validation Loss')
    plt.legend(loc='upper right')
    plt.title('Training and Validation Loss')
    plt.xlabel('Epochs')
    plt.ylabel('Loss')

    plt.show()

def visualize_images(images, labels, predictions):
    class_names = ['daisy', 'dandelion', 'roses', 'sunflowers', 'tulips']
    num_images = len(images)

    # 이미지 개수에 따라 적절한 행과 열을 계산합니다.
    rows = int(np.ceil(np.sqrt(num_images)))
    cols = int(np.ceil(num_images / rows))

    plt.figure(figsize=(15, 10))
    for i in range(num_images):
        plt.subplot(rows, cols, i + 1)
        plt.xticks([])
        plt.yticks([])
        plt.grid(False)
        plt.imshow(images[i])
        predicted_label = np.argmax(predictions[i])
        true_label = labels[i]
        if predicted_label == true_label:
            color = 'green'
        else:
            color = 'red'
        plt.xlabel("Predicted: {} ({})".format(class_names[predicted_label], 
                                                class_names[true_label]), color=color)

    plt.tight_layout()
    plt.show()
```
* 자주 사용할 법한 기능들을 함수를 사용하여 모듈화를 진행하여서 추 후, 모델을 재사용할 때 효율성이 좋을 것 같다.
