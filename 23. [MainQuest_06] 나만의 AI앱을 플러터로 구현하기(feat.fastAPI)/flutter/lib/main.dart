import 'dart:convert'; // JSON 파싱을 위한 라이브러리 추가

import 'package:flutter/material.dart'; // Material 디자인을 위한 라이브러리 추가
import 'package:http/http.dart' as http; // HTTP 요청을 위한 라이브러리 추가

void main() {
  // 앱 실행을 위한 main 함수
  runApp(MyApp()); // MyApp 위젯을 루트 위젯으로 사용하여 앱 실행
}

class MyApp extends StatelessWidget {
  // MyApp 위젯 정의
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '옷 추천 앱', // 앱 타이틀 설정
      theme: ThemeData(
        // 앱 테마 설정
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(), // 첫 화면으로 FirstScreen 위젯 사용
    );
  }
}
