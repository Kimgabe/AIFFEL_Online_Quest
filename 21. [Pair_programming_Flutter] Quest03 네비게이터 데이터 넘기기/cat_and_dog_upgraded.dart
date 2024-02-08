import 'package:flutter/material.dart'; // Flutter 프레임워크의 기본 UI 요소를 제공하는 패키지를 임포트합니다.
import 'package:url_launcher/url_launcher.dart'; // 웹 URL을 열기 위한 url_launcher 패키지를 임포트합니다.

void main() {
  runApp(MyApp()); // 앱을 시작하는 main 함수입니다. MyApp 위젯을 실행합니다.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(), // 앱의 홈 화면으로 FirstPage 위젯을 설정합니다.
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isCat = true; // 고양이 여부를 나타내는 변수를 선언하고 초기값으로 true를 할당합니다.
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'), // 앱 바의 제목을 설정합니다.
        leading: Icon(Icons.pets), // 앱 바의 왼쪽에 고양이 아이콘을 추가합니다.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Next'), // 버튼에 표시될 텍스트를 설정합니다.
              onPressed: () {
                print(isCat); // 고양이 여부를 콘솔에 출력합니다.
                // 두 번째 페이지로 네비게이션합니다.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(isCat: isCat), // SecondPage 위젯을 생성하고 isCat 값을 전달합니다.
                  ),
                );
              },
            ),
            SizedBox(height: 20), // 버튼과 이미지 사이의 간격을 추가합니다.
            Image.asset(
              'assets/cat.png', // 로컬 에셋에서 고양이 이미지를 로드합니다.
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20), // 이미지와 텍스트 사이의 간격을 추가합니다.
            Text(
              "Wanna find more cute pics for this cat?!", // 사용자에게 질문하는 텍스트를 표시합니다.
              style: TextStyle(fontSize: 18), // 텍스트 스타일을 설정합니다.
            ),
            SizedBox(height: 10), // 텍스트와 하이퍼링크 사이의 간격을 추가합니다.
            // 가운데 정렬을 위해 GestureDetector를 Center 위젯으로 감쌉니다.
            Center(
              child: GestureDetector(
                onTap: () {
                  // 인스타그램 링크를 열기 위한 URL
                  String instagramUrl = 'https://www.instagram.com/koomo_the_cat/'; // 여기에 인스타그램 프로필 링크를 넣으세요.
                  // URL을 열기 위한 조건문입니다.
                  if (instagramUrl != null) {
                    launch(instagramUrl); // url_launcher 패키지를 사용하여 인스타그램 링크를 엽니다.
                  } else {
                    print('Could not launch $instagramUrl'); // 링크를 열 수 없을 때 콘솔에 메시지를 출력합니다.
                  }
                },
                child: Text.rich(
                  TextSpan(
                    text: "👉 Check out the\n", // "Instagram"을 다음 줄로 옮깁니다.
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue, // 텍스트 색상을 설정합니다.
                      decoration: TextDecoration.underline, // 텍스트에 밑줄을 추가합니다.
                    ),
                    children: [
                      TextSpan(
                        text: "Instagram", // "Instagram" 텍스트를 추가합니다.
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue, // 텍스트 색상을 설정합니다.
                          decoration: TextDecoration.underline, // 텍스트에 밑줄을 추가합니다.
                        ),
                      ),
                      TextSpan(
                        text: " for Koomo!", // "for Koomo!" 텍스트를 추가합니다.
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue, // 텍스트 색상을 설정합니다.
                          decoration: TextDecoration.underline, // 텍스트에 밑줄을 추가합니다.
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // 텍스트를 가운데 정렬합니다.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final bool isCat;

  SecondPage({required this.isCat});

  @override
  Widget build(BuildContext context) {
    String instagramUrl = 'https://www.instagram.com/hodurang_marurang/'; // 두 번째 페이지의 인스타그램 링크를 설정합니다.
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/dog.png',
              width: 300,
              height: 300,
            ),
            SizedBox(height: 20),
            Text(
              "Wanna find more cute pics for those dogs?!",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            // 가운데 정렬을 위해 GestureDetector를 Center 위젯으로 감쌉니다.
            Center(
              child: GestureDetector(
                onTap: () {
                  if (instagramUrl != null) {
                    launch(instagramUrl); // url_launcher 패키지를 사용하여 인스타그램 링크를 엽니다.
                  } else {
                    print('Could not launch $instagramUrl');
                  }
                },
                child: Text.rich(
                  TextSpan(
                    text: "👉 Check out the\n",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                    children: [
                      TextSpan(
                        text: "Instagram",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: " for Hodu & Maru!!",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // 텍스트를 가운데 정렬합니다.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
