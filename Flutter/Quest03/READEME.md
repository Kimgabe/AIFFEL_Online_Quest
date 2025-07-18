# AIFFEL Campus Online Code Peer Review Templete
- 코더 : 강영현
- 리뷰어 : 김승순


# PRT(Peer Review Template)
- [x]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 코드를 캡쳐해 근거로 첨부
     
```dart
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('First Page'),
          centerTitle: true,
          leading: Center(
              child: FaIcon(
            FontAwesomeIcons.cat,
            size: 40,
          ))),
      body: Center(
          child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              height: 120,
            ),
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                width: 120,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    MyApp.is_cat = false;
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    );
                    print("${MyApp.is_cat}");
                  },
                  child: Text('Next'),
                ),
              )),
          Expanded(
              flex: 6,
              child: Image.asset(
                'images/cat.jpg',
                width: 300,
                height: 300,
              )),
        ],
      )),
    );
  }
}
```
- 기본적인 요구사항이었떤 아이콘 넣기, 버튼 생성, `is_cat` 변수 설정 및 페이지 넘김 부분이 모두 포함되어있습니다.
    
- [x]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```dart
          Expanded(
              flex: 1,
              child: SizedBox(
                width: 120,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    MyApp.is_cat = false;
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondPage()),
                    );
                    print("${MyApp.is_cat}");
                  },
                  child: Text('Next'),
                ),
              )),
```

- 개인적으로 퀘스트 수행시에 버튼 구현 및 `is_cat` 변수의 설정과 정보 전달이 퀘스트의 핵심기능이자 주요 과제였다고 생각하는데 이 부분이 구현이 잘 된것 같습니다.


- [x]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인

        
- [x]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 기록되어 있는지 확인
    - 전체 코드 실행 플로우를 그래프로 그려서 이해를 돕고 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```dart
/** 강영현
 * 진도가 밀리니 계속 퀘스트가 어려운 상황이다. 구정 때 제대로 공부해야겠다.
 * K - 나도 없다.
 * P - 아직 앞 부분 내용도 덜 숙지되어 있는 게 문제다.
 * T - 앞 부분부터 차근차근 공부를 해야, 이번 퀘스트 내용도 좀 더 이해가 잘 될 것 같다. 아직 코드 이해도가 떨어지므로, 좀 더 코드를 뜯어보도록 한다.
 * 
 * 
 */

/**
 * 최강훈
 * K - 그림으로 무엇을 넣어야 할지 대충 예측은 가능하다.
 * P - 아직 push와 pop에 관련된 내용들이 이해가 되지 않았다.
 * T - GPT에 물어봐서 구조들에 대해서 한번 살펴보았다.
 * 
 * 구조상으로는 기본적으로 무엇이 들어가야하는지는 알겠으나, 데이터 정보라는 것을
 * 전달한다는 것은 솔직ㅎ히 제대로 이해하지 못했습니다.
 * PopUntil 부분에서는 isFirst가 맨 처음에 선언한 Page로 넘어간다는 것에 대해서는
 * 이해는 하였는데, 이것을 보았을 때 is_cat 변수도 원래 상태로 초기화 되는줄
 * 알았는데 그건 아니였던 것 같다.
 */
```

- [x]  **5. 코드가 간결하고 효율적인가요?**
    - 파이썬 스타일 가이드 (PEP8) 를 준수하였는지 확인
    - 하드코딩을 하지않고 함수화, 모듈화가 가능한 부분은 함수를 만들거나 클래스로 짰는지
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 함수화했는지
        - 잘 작성되었다고 생각되는 부분을 캡쳐해 근거로 첨부합니다.

```dart
          Expanded(
            flex: 1,
            child: SizedBox(
                width: 120,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    // MyApp.is_cat = true;
                    // Navigator.of(context).pop(
                    //   MaterialPageRoute(builder: (context) => FirstPage()),
                    // );
                    Navigator.of(context).popUntil((route) {
                      if (route.isFirst) {
                        MyApp.is_cat = true;
                        return true;
                      } else {
                        return false;
                      }
                    });
                    print("${MyApp.is_cat}");
                  },
                  child: Text('Back'),
                )),
          ),
```

# 참고 링크 및 코드 개선
```
# 코드 리뷰 시 참고한 링크가 있다면 링크와 간략한 설명을 첨부합니다.
# 코드 리뷰를 통해 개선한 코드가 있다면 코드와 간략한 설명을 첨부합니다.
```
