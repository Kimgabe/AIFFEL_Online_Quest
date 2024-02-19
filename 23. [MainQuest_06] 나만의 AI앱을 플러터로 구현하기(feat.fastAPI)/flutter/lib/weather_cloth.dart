import 'dart:convert'; // JSON 파싱을 위한 라이브러리 추가

import 'package:flutter/material.dart'; // Material 디자인을 위한 라이브러리 추가
import 'package:geolocator/geolocator.dart'; // 위치 정보를 가져오기 위한 패키지 import 추가
import 'package:http/http.dart' as http; // HTTP 요청을 위한 라이브러리 추가
import 'package:permission_handler/permission_handler.dart'; // 위치 권한을 처리하기 위한 패키지 import 추가

void main() {
  runApp(MyApp()); // MyApp 위젯을 실행하여 앱 시작
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

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // 현재 위치 정보를 가져오는 메서드 호출
    _permission(); // 앱 실행 시 위치 권한을 얻는 메서드 호출
  }

  void _getCurrentLocation() async {
    // 현재 위치 정보를 가져오는 메서드
    try {
      // 예외 처리
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high); // 현재 위치 정보 가져오기
      _sendLocationToServer(
          position.latitude, position.longitude); // 서버로 위치 정보 전송
    } catch (e) {
      // 위치 정보를 가져오는 중에 예외가 발생한 경우
      print('Error getting location: $e'); // 위치 정보 가져오기 중 오류 로그 출력
    }
  }

  // 위치 정보를 서버로 전송하는 메서드
  void _sendLocationToServer(double latitude, double longitude) async {
    final url =
        'https://weather-cloth-fastapi-807c88b6bcd8.herokuapp.com/location'; // FastAPI 서버 엔드포인트
    try {
      // 예외 처리
      final response = await http.post(
        // HTTP POST 요청
        Uri.parse(url), // 요청 URL
        body: {
          'latitude': latitude.toString(), // 위도 데이터 전송
          'longitude': longitude.toString(), // 경도 데이터 전송
        },
      );

      if (response.statusCode == 200) {
        // 상태 코드가 200인 경우(성공)
        print('Location sent successfully.'); // 위치 전송 성공 로그 출력
      } else {
        // 상태 코드가 200이 아닌 경우(실패)
        print(
            'Failed to send location. Status code: ${response.statusCode}'); // 위치 전송 실패 로그 출력
      }
    } catch (e) {
      // 요청 중에 예외가 발생한 경우
      print('Error sending location: $e'); // 위치 전송 중 오류 로그 출력
    }
  }

  // 위치 권한을 처리하는 메서드
  void _permission() async {
    var status = await Permission.location.status; // 현재 위치 권한 상태를 가져옵니다.
    if (!status.isGranted) {
      // 위치 권한이 부여되지 않았다면
      // 위치 권한 요청
      var requestStatus = await Permission.location.request();
      if (requestStatus.isGranted) {
        // 권한이 승인된 경우
        print("Location permission granted.");
        _getCurrentLocation(); // 현재 위치 정보를 가져오는 메서드 호출
      } else {
        // 권한 요청이 거부된 경우
        print("Location permission denied.");
      }
    } else if (status.isGranted) {
      // 이미 위치 권한이 승인된 경우
      print("Location permission already granted.");
      _getCurrentLocation(); // 현재 위치 정보를 가져오는 메서드 호출
    }
  }

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

class SecondScreen extends StatefulWidget {
  // SecondScreen 위젯 정의
  @override
  _SecondScreenState createState() =>
      _SecondScreenState(); // SecondScreen 위젯의 상태를 관리하는 State 객체 생성
}

class _SecondScreenState extends State<SecondScreen> {
  // SecondScreen 위젯의 상태를 관리하는 State 객체 정의
  String _imagePath = 'assets/default.jpg'; // 이미지 경로를 저장할 변수(초기값 설정)
  double? temperature; // 온도를 저장할 변수(초기값 설정)
  String recommendationText =
      '현재 날씨에 따른 의상을 고르고 있어요\n 잠시만 기다려 주세요 😀'; // 추천 텍스트를 저장할 변수(초기값 설정)

  @override
  void initState() {
    // initState 메서드 재정의
    super.initState(); // 상위 클래스의 initState 메서드 호출
    _fetchWeatherRecommendationFromServer(); // 서버로부터 날씨 추천 정보를 가져오는 메서드 호출
  }

  // 서버로부터 날씨 추천 정보를 가져오는 메서드
  Future<void> _fetchWeatherRecommendationFromServer() async {
    final url =
        'https://weather-cloth-fastapi-807c88b6bcd8.herokuapp.com/weather_recommendation'; // FastAPI 서버 엔드포인트
    try {
      // 예외 처리
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10)); // HTTP GET 요청에 timeout 추가
      if (response.statusCode == 200) {
        // 상태 코드가 200인 경우(성공)
        final decodedBody =
            utf8.decode(response.bodyBytes); // UTF-8로 인코딩된 응답 바디를 디코딩(한글깨짐방지)
        final data = jsonDecode(decodedBody); // 디코딩된 응답 데이터 파싱
        setState(() {
          // 상태 업데이트
          temperature = (data['temperature'] as num).toDouble(); // 온도 데이터 업데이트
          recommendationText = data['recommendation_text']; // 추천 텍스트 데이터 업데이트
          _updateImageBasedOnTemperature(temperature); // 온도에 따른 이미지 업데이트
        });
      } else {
        // 상태 코드가 200이 아닌 경우(실패)
        _showErrorDialog(
            'AI가 의상을 선정하는데 실패했어요 😅 \n 다시 한번만 시도해주세요🙏'); // 오류 메시지 표시
      }
    } catch (e) {
      // 요청 중에 예외가 발생한 경우
      _showErrorDialog(
          'AI가 의상을 선정하는데 실패했어요 😅 \n 다시 한번만 시도해주세요🙏'); // 오류 메시지 표시
    }
  }

  // 온도에 따라 이미지를 업데이트하는 메서드
  void _updateImageBasedOnTemperature(double? temp) {
    if (temp != null) {
      if (temp >= 28) {
        _imagePath = 'assets/28_degree.png';
      } else if (temp >= 23 && temp < 28) {
        _imagePath = 'assets/23_27_degree.png';
      } else if (temp >= 20 && temp < 23) {
        _imagePath = 'assets/20_22_degree.png';
      } else if (temp >= 17 && temp < 20) {
        _imagePath = 'assets/17_19_degree.png';
      } else if (temp >= 12 && temp < 17) {
        _imagePath = 'assets/12_16_degree.png';
      } else if (temp >= 9 && temp < 12) {
        _imagePath = 'assets/9_11_degree.png';
      } else if (temp >= 5 && temp < 9) {
        _imagePath = 'assets/5_8_degree.png';
      } else if (temp <= 4) {
        _imagePath = 'assets/4_degree.png';
      }
    }
  }

  // 오류 메시지를 표시하는 메서드
  void _showErrorDialog(String message) {
    showDialog(
      context: context, // 컨텍스트 설정
      builder: (ctx) => AlertDialog(
        // AlertDialog 위젯을 사용하여 오류 메시지 표시
        title: Text('오류 발생'), // 오류 제목 설정
        content: Text(message), // 오류 메시지 설정
        actions: <Widget>[
          // 액션 버튼 설정
          TextButton(
            child: Text('확인'), // 확인 버튼 텍스트 설정
            onPressed: () {
              Navigator.of(ctx).pop(); // 다이얼로그 닫기
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 앱바 설정
        title: Text(
          '☁ CIC OOTD ⛅',
          style: TextStyle(
            fontFamily: "DNFBitBitv2",
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        leading: Image.asset('assets/icon.png'), // 좌측상단 아이콘을 이미지로
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // 그림자 높이 설정
          child: Container(
            color: Colors.black,
            height: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset(
                  _imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Text(
                  recommendationText,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          child: Center(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
