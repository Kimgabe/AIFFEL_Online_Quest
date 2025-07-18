
# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 강영현
- 리뷰어 : 이선재


# PRT(Peer Review Template)
- [X]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 코드를 캡쳐해 근거로 첨부
    <img width="557" alt="스크린샷 2024-01-09 오후 5 26 26" src="https://github.com/thetjswo/AIFFEL_Online_Quest_khy/assets/74177040/8b687a8b-6120-4937-b0e0-7c1c9fe0fdf8">
    [리뷰] 원본 사진과 인물 모드를 적용한 인물 사진의 차이를 알 수 있게 결과물이 출력되었다.

    <img width="585" alt="스크린샷 2024-01-09 오후 5 26 34" src="https://github.com/thetjswo/AIFFEL_Online_Quest_khy/assets/74177040/76b38987-02a1-4dc9-a121-e65767cbc97e">
    [리뷰] 원본 사진과 인물 모드를 적용한 동물 사진의 차이를 알 수 있게 결과물이 출력되었다.
    
    <img width="924" alt="스크린샷 2024-01-09 오후 5 32 10" src="https://github.com/thetjswo/AIFFEL_Online_Quest_khy/assets/74177040/06486a92-eb44-49f0-a7bb-ea8fd9c539c8">
    [리뷰] 루브릭에서 요구하는 사항에 맞게 결과물이 출력되었다.

    <img width="917" alt="스크린샷 2024-01-09 오후 5 27 11" src="https://github.com/thetjswo/AIFFEL_Online_Quest_khy/assets/74177040/d16ff378-1168-4931-9567-fd5b539dad74">
    [리뷰] 문제점을 파악하는 부분이 명시되어있다.

    ```
    Step 3. 해결 방법을 제안해 보기
    1. 블러 대신 양방향 필터를 적용해 보자
    마스킹 필터에서 블러(Blur) 대신 양방향 필터(Bilateral Filter)를 사용하는 것은 이미지 처리에서 엣지 보존 및 선명도 강조 측면에서 더 좋은 결과를 제공할 수 있습니다.
    
    블러(Blur) vs. 양방향 필터(Bilateral Filter):
    
    블러(Blur): 이미지의 픽셀 값을 평균화하여 부드럽게 만드는 필터링 기법입니다. 이는 이미지를 흐릿하게 만들어 경계를 모호하게 할 수 있습니다. 경계가 흐릿해지면 마스킹된 영역의 경계도 흐려지게 되어 선명도와 디테일이 손실될 수 있습니다.
    
    양방향 필터(Bilateral Filter): 이미지의 블러링을 수행하면서도 엣지 정보를 보존하는 필터입니다. 이 필터는 픽셀을 블러 처리하는 동시에 주변 픽셀과의 값 차이를 고려하여 엣지를 보존합니다. 따라서 더 선명한 엣지를 유지하면서 노이즈를 줄일 수 있습니다. Masking에 양방향 필터 적용:
    
    양방향 필터를 사용하면 마스킹하려는 이미지를 블러 처리할 때에도 엣지를 보존하여 경계를 더욱 명확하게 유지할 수 있습니다. 마스킹된 영역과 주변 배경 사이의 경계를 더 정확하게 유지하면서, 더 나은 시각적 구분을 제공합니다 . 결과적으로, 마스킹 필터에 양방향 필터를 적용하면 블러링을 수행하면서도 엣지를 보존하여 이미지의 선명도를 유지하면서 명확한 마스킹을 얻을 수 있습니다.
    
    양방향 필터를 사용함으로써 마스킹된 영역과 배경 간의 경계를 더욱 선명하게 유지하면서도 필터링 작업을 수행할 수 있어, 마스킹 작업에 더 좋은 결과를 얻을 수 있을 것입니다.
    
    -ChatGPT-
    
    구현이 가능할 것 같으므로 한 번 Bilateral Filter로 진행해보자.
    가장 블러 처리가 잘 안 된 세 번째 사진을 가지고 진행해보겠다.
    ```
    [리뷰] 문제점에 대한 솔루션을 요구사항에 맞게 제시하였다.

--- 
    
- [X]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
    ```
    # 원본이미지를 img_show에 할당한뒤 이미지 사람이 있는 위치와 배경을 분리해서 표현한 color_mask 를 만든뒤 두 이미지를 합쳐서 출력
    img_show = img_orig_gabi.copy() # 원본 이미지를 수정하지 않고 복사본을 사용하기 img_show에 복자
    
    # True과 False인 값을 각각 255과 0으로 바꿔줍니다
    img_mask = seg_map.astype(np.uint8) * 255 # True는 사람 위치를 나타내며 255(흰색), False는 배경을 나타내며 0(검은색)
                                              # np.uint8 - 부호 없는 8비트 정수(unsigned 8-bit integer)
    # 255와 0을 적당한 색상으로 바꿔봅니다 (색상 마스크 만들기)
    color_mask = cv2.applyColorMap(img_mask, cv2.COLORMAP_JET) # img_mask에 적당한 컬러 맵을 적용하여 색상 마스크(color_mask)를 만든다.
                                                               # cv2.COLORMAP_JET을 사용하여 마스크 이미지의 값을 적절한 색상으로 매핑
    
    # 원본 이미지와 마스크를 적당히 합쳐봅니다
    # 0.6과 0.4는 두 이미지를 섞는 비율입니다.
    img_show = cv2.addWeighted(img_show, 0.6, color_mask, 0.4, 0.0) # img_show와 color_mask를 일정 비율로 합성하여 최종적인 시각화 이미지를 만듦
                                                                    # cv2.addWeighted() 함수를 사용하여 두 이미지를 섞어서 출력 이미지를 생성
                                                                    # 첫 번째 이미지는 img_show로, 두 번째 이미지는 color_mask로 설정되었으며, 0.6과 0.4는 각 이미지의 가중치를 나타냄
    plt.imshow(cv2.cvtColor(img_show, cv2.COLOR_BGR2RGB)) # img_show는 원본 이미지와 사람의 위치를 강조한 컬러 마스크를 합친 이미지
    plt.show()
    ```
    [리뷰] 이미지의 픽셀값을 변환시켜야 하는 코드여서 이해하기 어려웠는데 영현 그루님의 코드를 보면 바로 이해할 수 있을 것 같다.
---
        
- [X]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
    ```
    segvalues, output = model.segmentAsPascalvoc(img_path3) # segmentAsPascalvoc()함수를 호출 하여 입력된 이미지를 분할, 분할 출력의 배열을 가져옴, 분할은 pacalvoc 데이터로 학습된 모델을 이용                                                
    
    #segmentAsPascalvoc() 함수를 호출하여 입력된 이미지를 분할한 뒤 나온 결과값 중 output을 matplotlib을 이용해 출력
    plt.imshow(output)
    plt.show()
    
    
    segvalues # segmentAsPascalvoc() 함수를 호출하여 입력된 이미지를 분할한 뒤 나온 결과값 중 배열값을 출력
    
    #segvalues에 있는 class_ids를 담겨있는 값을 통해 pacalvoc에 담겨있는 라벨을 출력
    for class_id in segvalues['class_ids']:
        print(LABEL_NAMES[class_id])
    	
    # 아래 코드를 이해하지 않아도 좋습니다
    # PixelLib에서 그대로 가져온 코드입니다
    # 주목해야 할 것은 생상 코드 결과물이예요!
    
    #컬러맵 만들기 
    colormap = np.zeros((256, 3), dtype = int)
    ind = np.arange(256, dtype=int)
    
    for shift in reversed(range(8)):
        for channel in range(3):
            colormap[:, channel] |= ((ind >> channel) & 1) << shift
        ind >>= 3
    
    colormap[:20] #생성한 20개의 컬러맵 출력
    
    colormap[15] #컬러맵 15에 해당하는 배열 출력 (pacalvoc에 LABEL_NAMES 15번째인 사람)
    
    seg_color = (128,128,192) # 색상순서 변경 - colormap의 배열은 RGB 순이며 output의 배열은 BGR 순서로 채널 배치가 되어 있어서
    # output 형태 확인
    output.shape # output 배열은 모델이 분할한 결과로, 각 픽셀에 대한 색상 정보를 담고 있다.
    
    # output의 픽셀 별로 색상이 seg_color와 같다면 1(True), 다르다면 0(False)이 됩니다
    # seg_color 값이 person을 값이 므로 사람이 있는 위치를 제외하고는 gray로 출력
    # cmap 값을 변경하면 다른 색상으로 확인이 가능함
    seg_map = np.all(output==seg_color, axis=-1) # output과 seg_color를 비교하여 모든 채널에 대해 같은 색상인지를 확인한다. 
                                                 # axis=-1은 마지막 차원(컬러 채널)을 기준으로 비교하라는 의미한다.
    print(seg_map.shape) 
    plt.imshow(seg_map, cmap='gray') # cmap 파라미터를 설정하면 데이터의 값을 어떤 색상으로 나타낼지를 결정할 수 있다. 
                                     # 예를 들어, 'gray'로 설정하면 흑백 이미지처럼 보일 것이고, 'viridis', 'jet', 'hot' 등 다양한 컬러맵을 적용하여 데이터를 다양한 색상으로 표현한다.
                                     # seg_map의 True(1)는 흰색, False(0)는 검은색으로 표시된다.
    plt.show()
    
    # 원본이미지를 img_show에 할당한뒤 이미지 사람이 있는 위치와 배경을 분리해서 표현한 color_mask 를 만든뒤 두 이미지를 합쳐서 출력
    img_show = img_orig3.copy() # 원본 이미지를 수정하지 않고 복사본을 사용하기 img_show에 복자
    
    # True과 False인 값을 각각 255과 0으로 바꿔줍니다
    img_mask = seg_map.astype(np.uint8) * 255 # True는 사람 위치를 나타내며 255(흰색), False는 배경을 나타내며 0(검은색)
                                              # np.uint8 - 부호 없는 8비트 정수(unsigned 8-bit integer)
    # 255와 0을 적당한 색상으로 바꿔봅니다 (색상 마스크 만들기)
    color_mask = cv2.applyColorMap(img_mask, cv2.COLORMAP_JET) # img_mask에 적당한 컬러 맵을 적용하여 색상 마스크(color_mask)를 만든다.
                                                               # cv2.COLORMAP_JET을 사용하여 마스크 이미지의 값을 적절한 색상으로 매핑
    
    # 원본 이미지와 마스크를 적당히 합쳐봅니다
    # 0.6과 0.4는 두 이미지를 섞는 비율입니다.
    img_show = cv2.addWeighted(img_show, 0.6, color_mask, 0.4, 0.0) # img_show와 color_mask를 일정 비율로 합성하여 최종적인 시각화 이미지를 만듦
                                                                    # cv2.addWeighted() 함수를 사용하여 두 이미지를 섞어서 출력 이미지를 생성
                                                                    # 첫 번째 이미지는 img_show로, 두 번째 이미지는 color_mask로 설정되었으며, 0.6과 0.4는 각 이미지의 가중치를 나타냄
    plt.imshow(cv2.cvtColor(img_show, cv2.COLOR_BGR2RGB)) # img_show는 원본 이미지와 사람의 위치를 강조한 컬러 마스크를 합친 이미지
    plt.show()
    
    # 양방향 필터(Bilateral Filter)를 사용하여 이미지 처리
    # (5, 75, 75)는 필터의 크기와 시그마 값에 대한 매개변수입니다. 이 값을 변경하여 다양한 효과를 확인할 수 있습니다.
    img_orig_bilateral = cv2.bilateralFilter(img_orig3, 10, 600, 600)
    
    # 이미지 출력
    plt.imshow(cv2.cvtColor(img_orig_bilateral, cv2.COLOR_BGR2RGB))
    plt.show()
    
    # cv2.cvtColor(입력 이미지, 색상 변환 코드): 입력 이미지의 색상 채널을 변경
    # cv2.COLOR_BGR2RGB: 원본이 BGR 순서로 픽셀을 읽다보니
    # 이미지 색상 채널을 변경해야함 (BGR 형식을 RGB 형식으로 변경) 
    img_mask_color = cv2.cvtColor(img_mask, cv2.COLOR_GRAY2BGR)
    
    # cv2.bitwise_not(): 이미지가 반전됩니다. 배경이 0 사람이 255 였으나
    # 연산을 하고 나면 배경은 255 사람은 0입니다.
    img_bg_mask = cv2.bitwise_not(img_mask_color)
    
    # cv2.bitwise_and()을 사용하면 배경만 있는 영상을 얻을 수 있습니다.
    # 0과 어떤 수를 bitwise_and 연산을 해도 0이 되기 때문에 
    # 사람이 0인 경우에는 사람이 있던 모든 픽셀이 0이 됩니다. 결국 사람이 사라지고 배경만 남아요!
    img_bg_bilateral = cv2.bitwise_and(img_orig_bilateral, img_bg_mask)
    plt.imshow(cv2.cvtColor(img_bg_bilateral, cv2.COLOR_BGR2RGB))
    plt.show()
    
    # np.where(조건, 참일때, 거짓일때)
    # 세그멘테이션 마스크가 255인 부분만 원본 이미지 값을 가지고 오고 
    # 아닌 영역은 블러된 이미지 값을 사용합니다.
    img_concat3 = np.where(img_mask_color==255, img_orig3, img_bg_bilateral)
    # plt.imshow(): 저장된 데이터를 이미지의 형식으로 표시한다.
    # cv2.cvtColor(입력 이미지, 색상 변환 코드): 입력 이미지의 색상 채널을 변경
    # cv2.COLOR_BGR2RGB: 원본이 BGR 순서로 픽셀을 읽다보니 
    # 이미지 색상 채널을 변경해야함 (BGR 형식을 RGB 형식으로 변경)
    plt.imshow(cv2.cvtColor(img_concat3, cv2.COLOR_BGR2RGB))
    plt.show()
    ```
    [리뷰] 기존 방법에서 발생하는 문제점에 대한 솔루션을 실제로 시도를 하고 그 결과를 비교하는 결과를 출력하였다. 
        
- [X]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 기록되어 있는지 확인
    - 전체 코드 실행 플로우를 그래프로 그려서 이해를 돕고 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
    ```
    회고문
    segmentaion을 이용해서 이렇게 아이폰 인물모드를 구현해볼 수 있어서 신기했다. 결과를 이미지로 출력하는 것은 원본 이미지의 변화를 확인할 수 있어서 흥미롭고 재미있는 것 같다.
    
    다만 처리를 하는 과정을 함수로 구현해서 다수의 사진에 적용을 하는 간단한 방법이 있을 것 같은데, 아직 코딩 초보자인 내가 class나 함수를 구현하지 못 해서 굉장히 번거로운 작업을 했던 것 같다. 언제 나는 코딩을 잘하게 될까? ㅠㅠ
    
    그 외에도 semantic segmentation mask의 오류를 보완할 수 있는 좋은 솔루션을 찾는 게 어려웠다. 아직 공부해야 할 게 참 많다고 느껴지는 이번 프로젝트였다.
    
    모델이나 알고리즘에 대한 설명을 제시하는 사이트에 들어가도, 원리나 내용을 이해하는 게 아직도 어렵다. 어떻게 하면 잘 이해할 수 있을지 궁금하다. 공부는 끝이 없는 것 같다.
    
    KEEP: 노드에서 제시되지 않은 코드로 결과물을 출력해야 할 때 구글링이나 gpt를 이용하여 시도하려고 한 점.
    
    PROBLEM: 공부해야 하는 게 너무 많은 것 같다. 모델이나 알고리즘 설명 관련 사이트에서 내용을 이해하는 게 너무 어렵다. 제대로 이해하려고 하면 밑도 끝도 없이 시간을 할애해야 한다.
    
    TRY: 명확한 해결 방법을 찾아보기, 어려워도 이해하기 위해서 빈 시간 투자하기 (공부는 해야 는다!)
    ```
    [리뷰] 프로젝트를 하면서 느낀점에 대한 회고가 잘 작성이 되었다.
---

- [X]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 하드코딩을 하지않고 함수화, 모듈화가 가능한 부분은 함수를 만들거나 클래스로 짰는지
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 함수화했는지
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.
    ```
    import matplotlib.pyplot as plt

    image1 = cv2.cvtColor(img_orig1, cv2.COLOR_BGR2RGB)
    image2 = cv2.cvtColor(img_orig2, cv2.COLOR_BGR2RGB)
    image3 = cv2.cvtColor(img_orig3, cv2.COLOR_BGR2RGB)
    image4 = cv2.cvtColor(img_orig4, cv2.COLOR_BGR2RGB)
    image5 = cv2.cvtColor(img_orig_gabi, cv2.COLOR_BGR2RGB)
    
    b_image1 = cv2.cvtColor(img_concat1, cv2.COLOR_BGR2RGB)
    b_image2 = cv2.cvtColor(img_concat2, cv2.COLOR_BGR2RGB)
    b_image3 = cv2.cvtColor(img_concat3, cv2.COLOR_BGR2RGB)
    b_image4 = cv2.cvtColor(img_concat4, cv2.COLOR_BGR2RGB)
    b_image5 = cv2.cvtColor(img_concat5, cv2.COLOR_BGR2RGB)
    
    images = [image1, image2, image3, image4, image5]
    blurred_images = [b_image1, b_image2, b_image3, b_image4, b_image5]
    
    plt.figure(figsize=(20, 15))
    
    for idx, image in enumerate(images):
        plt.subplot(2, 5, idx+1)
        plt.imshow(image, cmap=None)
        plt.title('Original Image')
        plt.axis('off')
        
    for idx, image in enumerate(blurred_images):
        plt.subplot(2, 5, len(images)+idx+1)
        plt.imshow(image)
        plt.title('Blurred Image')
        plt.axis('off')
        
    # 간격 조절
    # plt.subplots_adjust(wspace=0.2, hspace=0)  # 가로 간격과 세로 간격 조절
    plt.tight_layout() # subplot 간의 간격을 조절하여 subplot들이 균일하게 배치
    
    plt.show()
    ```
    <img width="915" alt="스크린샷 2024-01-09 오후 5 26 47" src="https://github.com/thetjswo/AIFFEL_Online_Quest_khy/assets/74177040/39693b37-5f96-45ed-9de4-f1d04f1bbedf">
    [리뷰] 다 수의 이미지에 대한 결과를 보기 좋게 정리하여 시각화하였다.


# 참고 링크 및 코드 개선
```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
