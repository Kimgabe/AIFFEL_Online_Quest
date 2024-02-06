import 'package:flutter/material.dart'; // Material 라이브러리를 임포트

void main() {
  // 애플리케이션의 시작점
  runApp(MyApp()); // MyApp 위젯을 실행
}

class MyApp extends StatelessWidget {
  // StatelessWidget을 상속받는 MyApp 클래스를 정의
  @override // 상속받은 메서드를 재정
  Widget build(BuildContext context) {
    // 빌드 메서드를 재정
    return MaterialApp(
      // MaterialApp을 반환
      home: Scaffold(
        // Scaffold를 반환
        appBar: AppBar(
          // AppBar를 설정
          backgroundColor: Colors.indigo, // AppBar 배경색을 인디고색으로 설정
          title: Text('플러터 앱 만들기'), // AppBar 중앙 텍스트
          leading: Icon(
            // AppBar 좌측 상단 아이콘을 설정
            Icons.favorite, // 아이콘을 하트 모양으로 설정
            color: Colors.white, // 아이콘 색상을 흰색으로 설정
          ),
        ),
        body: Column(
          // Column을 사용하여 세로로 위젯을 배치
          mainAxisAlignment:
          MainAxisAlignment.center, // Column의 세로 정렬을 중앙으로 설정
          children: [
            // Column의 자식으로 아이콘과 텍스트를 추가
            SizedBox(height: 48), // AppBar와 버튼 사이의 공간을 추가
            ElevatedButton(
              // 버튼을 생성
              onPressed: () {
                // 버튼이 눌렸을 때 실행될 콜백 함수를 정의
                print("버튼이 눌렸습니다"); // 버튼 클릭 시 콘솔에 메시지 출력
              }, // 버튼이 눌렸을 때 실행될 콜백 함수를 설정
              child: Text(
                "Text",
                style: TextStyle(
                  fontSize: 32, // 텍스트 사이즈를 32로 설정하여 크게 만들기
                ),
              ), // 버튼에 표시될 텍스트
              style: ElevatedButton.styleFrom(
                // 버튼의 스타일을 설정합니다.
                fixedSize: Size(200, 100), // 버튼의 가로 200, 세로 100 사이즈로 설정
                shape: RoundedRectangleBorder(
                  // 버튼의 모양을 직사각형으로 설정
                  borderRadius: BorderRadius.circular(
                      0), // 모서리 둥글기를 0으로 설정해 모서리가 둥글지 않게 설정
                ),
              ),
            ),
            Expanded(
              // Column의 나머지 공간을 차지하도록 설정
              child: Align(
                // Align을 사용하여 자식 위젯을 정렬
                alignment: FractionalOffset.center, // 자식 위젯을 중앙으로 정렬
                child: Stack(
                  // Stack을 사용하여 위젯을 겹쳐서 배치
                  alignment: Alignment.topLeft, // Stack의 자식 위젯들을 왼쪽 상단으로 정렬
                  children: List.generate(5, (index) {
                    // 5개의 컨테이너를 생성
                    return Container(
                      // 컨테이너를 생성합니다.
                      width: 300.0 - index * 60.0, // 컨테이너의 너비를 설정
                      height: 300.0 - index * 60.0, // 컨테이너의 높이를 설정
                      decoration: BoxDecoration(
                        // 컨테이너의 장식을 설정
                        color: Colors
                            .indigo[100 * (index + 1)], // 컨테이너의 색상을 설정
                        border: Border.all(
                          // 컨테이너의 테두리를 설정
                          color: Colors.indigo[900]!, // 테두리의 색상을 설정
                          width: 3, // 테두리의 두께를 설정
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/*
김승순 회고

KEEP
- 전반적인 학습 내용응 응용해서 가이드에 따라서 차근 차근 적용했다.
- 구현 과정을 이해하기 위해 최대한 주석을 자세하게 작성했다.

PROBLEM
- 각각의 기능은 알고 있는데, 이것을 연결하는 것이 어려운것 같다.
TRY
- 각각의 구조를 머리속으로 그리고 연결하기 위한 괄호들을 잘 연결하게 구성을 파악하는 연습이 필요하다.
- 결국은 많으 실만많이 답!

홍채림 회고

KEEP
- 컬러 적용하는 것을 잘 공부두길 잘한 것 같다. 
PROBLEM
- 구조의 흐름은 만들어둔 것을 읽는 것은 괜찮지만, 직접 구현을 하는 것은 좀 어렵다. 
TRY
- 구조를 좀 더 자세하게 확실히 알기 위해서 책을 좀 더 읽어봐야겠다. 그리고 코드를 열심히 필사해봐야겠다. 


*//