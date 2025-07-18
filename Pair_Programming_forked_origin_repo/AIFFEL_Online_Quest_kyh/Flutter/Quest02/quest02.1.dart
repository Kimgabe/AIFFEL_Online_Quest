import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('플러터 앱 만들기'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: null, // 아무 동작도 수행하지 않음
          ),
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, -0.4),
              child: ElevatedButton(
                onPressed: () {
                  print('버튼이 눌렸습니다.');
                },
                child: Text('Text'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey)),
              ),
            ),
            Column(children: [
              Expanded(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 300,
                        height: 300,
                        color: Colors.red,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 240,
                        height: 240,
                        color: Colors.green,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 180,
                        height: 180,
                        color: Colors.yellow,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 120,
                        height: 120,
                        color: Colors.blue,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 60,
                        height: 60,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

// 회고문
// 이승환
  // K : 책과 퀘스트 내용을 보고 응용하여 작성하였다.
  // P : Stack 부분이 퀘스트 내용과 다르게 되었다.
  // T : Stack 부분에 부모와 자식 부분을 나눠서 작업을 해보면 될거 같다.
  // 오늘 인터페이스 배운 부분들을 응용하여 작업을 하였다. 부모, 자식 관계를 좀 더 공부 해야할것 같다.

// 강영현
  // K : 아직 내용이 덜 숙지되어 있지만, 할 수 있는 선에서 코딩을 해보려고 했다.
  // P : 책 내용이 덜 숙지되어 있다 보니 응용하는 게 어려웠다.
  // T : 해결하지 못 한 부분을 책을 좀 더 꼼꼼히 본 후, 다시 시도해 봐야겠다.
  // 승환님이 알려주신 방법대로 공부하는 게 좋은 것 같다. 한번 따라서 공부해 봐야겠다.