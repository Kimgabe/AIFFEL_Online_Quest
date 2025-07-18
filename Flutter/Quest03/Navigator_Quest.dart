import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static bool is_cat = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat and Dog',
      home: Navigator(
        pages: [
          MaterialPage(child: FirstPage()),
          if (is_cat == false) MaterialPage(child: SecondPage())
        ],
        onPopPage: (route, result) => route.didPop(result),
      ),
    );
  }
}

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

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Second Page'),
          centerTitle: true,
          leading: Center(
            child: FaIcon(FontAwesomeIcons.dog, size: 40),
          )),
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
          Expanded(
              flex: 6,
              child: Image.asset(
                'images/dog.jpg',
                width: 300,
                height: 300,
              )),
        ],
      )),
    );
  }
}

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
