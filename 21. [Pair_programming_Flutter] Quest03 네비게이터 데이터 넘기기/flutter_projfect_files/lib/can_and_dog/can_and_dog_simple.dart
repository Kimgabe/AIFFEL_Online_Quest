// import 문장: Flutter에서 필요한 라이브러리를 가져옴
import 'package:flutter/material.dart';

// 앱의 진입점을 정의하는 main 함수
void main() {
  // MyApp 위젯을 실행하여 앱을 시작
  runApp(MyApp());
}

// 앱의 기본 위젯을 정의하는 MyApp 클래스
class MyApp extends StatelessWidget {
  // MyApp 위젯의 UI를 생성하는 build 메서드
  @override
  Widget build(BuildContext context) {
    // MaterialApp을 반환하여 앱의 전반적인 머티리얼 디자인을 적용
    return MaterialApp(
      // 앱의 홈 화면을 FirstPage 위젯으로 설정
      home: FirstPage(),
    );
  }
}

// 첫 번째 페이지를 정의하는 FirstPage 클래스
class FirstPage extends StatelessWidget {
  // FirstPage 위젯의 UI를 생성하는 build 메서드
  @override
  Widget build(BuildContext context) {
    // 고양이 여부를 나타내는 변수를 초기화
    bool is_cat = true;
    // Scaffold 위젯을 반환하여 머티리얼 디자인의 기본 구조를 생성
    return Scaffold(
      // 앱 바를 생성하고 제목과 아이콘을 설정
      appBar: AppBar(
        title: Text('First Page'), // 앱 바의 제목 설정
        leading: Icon(Icons.pets), // 앱 바의 왼쪽에 고양이 아이콘 추가
      ),
      // 바디 부분을 생성하여 화면 중앙에 컬럼을 배치
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 다음 페이지로 이동하는 버튼 위젯 생성
            ElevatedButton(
              child: Text('Next'), // 버튼 텍스트 설정
              onPressed: () {
                print(is_cat); // 디버그 콘솔에 고양이 여부 출력
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(
                        isCat: false), // 두 번째 페이지로 이동하고 고양이 여부를 false로 설정하여 전달
                  ),
                );
              },
            ),
            SizedBox(height: 20), // 간격 추가
            Image.asset(
              'assets/cat.png', // 고양이 이미지를 출력
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}

// 두 번째 페이지를 정의하는 SecondPage 클래스
class SecondPage extends StatelessWidget {
  // 첫 번째 페이지에서 전달받은 고양이 여부를 저장하는 변수
  final bool isCat;

  // 생성자를 통해 isCat 변수를 초기화
  SecondPage({required this.isCat});

  // SecondPage 위젯의 UI를 생성하는 build 메서드
  @override
  Widget build(BuildContext context) {
    // Scaffold 위젯을 반환하여 머티리얼 디자인의 기본 구조를 생성
    return Scaffold(
      // 앱 바를 생성하고 제목을 설정
      appBar: AppBar(
        title: Text('Second Page'), // 앱 바의 제목 설정
      ),
      // 바디 부분을 생성하여 화면 중앙에 컬럼을 배치
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 이전 페이지로 돌아가는 버튼 위젯 생성
            ElevatedButton(
              child: Text('Back'), // 버튼 텍스트 설정
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            SizedBox(height: 20), // 간격 추가
            Image.asset(
              'assets/dog.png', // 강아지 이미지를 출력 (이미지 파일 경로에 맞게 수정 필요)
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}


/* 회고

김승순 회고

KEEP
- 기본적인 구조를 머릿속에 그리고 구조를 잡아가면서 코드를 작성하려 했다.
- 유사한 구조여서 분업을 통해 첫번째 페이지와 두번째 페이지를 각각 작성해 작업 효율을 높였다.
- 사이즈로 이미지 밑에 web url을 연결하는 기능을 찾아보고 적용했다(2번째 파일에 구현)


PROBLEM
- {} 를 분류하고 indent에 맞게 작성하는것에 많이 어려움이 있다.
- 전체 코드의 구조를 보고 각각의 기능에 맞는 객체들이 처음에 딱 떠오르지 않아서 좀 구조 잡기가 어렵다.

TRY
- 실습을 좀 많이 해봐야겠다. 특히 유툽에 보니까 클론 코딩으로 유명한 웹 플랫폼이나 앱을 구현해보는 것들이 많다.
- 설 연휴에 이런 것들을 시도해봐야겠다.

오우진 회고

KEEP

PROBLEM

TRY
*/