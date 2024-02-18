import 'dart:convert'; // JSON 파싱을 위한 라이브러리 추가

import 'package:flutter/material.dart'; // Material 디자인을 위한 라이브러리 추가

class FirstScreen extends StatelessWidget {
  // FirstScreen 위젯 정의
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 앱바 설정
        title: Text(
          '☁ CIC OOTD ⛅', // 앱바 타이틀 설정
          style: TextStyle(
            fontFamily: "DNFBitBitv2", // 사용할 폰트 설정
            fontWeight: FontWeight.w500, // 폰트 굵기 설정
          ),
          textAlign: TextAlign.center, // 가운데 정렬을 위해 textAlign 속성을 추가합니다.
        ),
        flexibleSpace: Container(
          // 앱바 배경색 설정
          decoration: BoxDecoration(
            // 그라데이션 배경색 설정
            gradient: LinearGradient(
              // 그라데이션 효과 설정
              colors: [Colors.blue, Colors.purple, Colors.red], // 그라데이션 색상 설정
              begin: Alignment.topLeft, // 그라데이션 시작점 설정
              end: Alignment.bottomRight, // 그라데이션 종료점 설정
            ),
          ),
        ),
        leading: Image.asset('assets/icon.png'), // 이 부분을 추가하여 좌측 상단에 아이콘을 넣습니다.
        bottom: PreferredSize(
          // 앱바 하단에 그림자 효과를 주기 위해 PreferredSize 위젯을 추가합니다.
          preferredSize: Size.fromHeight(4.0), // 그림자 높이 설정
          child: Container(
            // 그림자 효과를 주기 위한 컨테이너 설정
            color: Colors.black, // 그림자 색상 설정
            height: 0.5, // 그림자 높이 설정
          ),
        ),
      ),
      body: Center(
        // 화면 중앙에 위젯 배치
        child: Column(
          // 세로 방향으로 위젯 배치
          mainAxisAlignment: MainAxisAlignment.center, // 세로 방향으로 중앙 정렬
          children: <Widget>[
            // 자식 위젯으로 컬럼 위젯 사용
            Image.asset('assets/thumbnail.png'), // 이미지 표시
            SizedBox(height: 32.0), // 이미지와 버튼 사이 간격
            ElevatedButton(
              // 버튼 추가
              onPressed: () {
                // 버튼 클릭 시 이벤트 처리
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SecondScreen()), // SecondScreen으로 이동
                );
              },
              child: Text('오늘 입을 옷 추천받기!'), // 버튼 텍스트 설정
            ),
          ],
        ),
      ),
    );
  }
}
