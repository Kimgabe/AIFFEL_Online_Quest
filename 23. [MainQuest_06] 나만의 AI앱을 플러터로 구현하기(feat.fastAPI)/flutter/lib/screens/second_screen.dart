class SecondScreen extends StatefulWidget {
  // SecondScreen 위젯 정의
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String _imagePath = 'assets/default.jpg'; // 기본 이미지 경로
  double? temperature; // 온도 저장 변수
  String recommendationText =
      '현재 날씨에 따른 의상을 고르고 있어요\n 잠시만 기다려 주세요 😀'; // 추천 텍스트 저장 변수

  @override
  void initState() {
    // 위젯 초기화 시 호출되는 함수
    super.initState();
    _fetchWeatherRecommendationFromServer(); // 초기화 시 서버로부터 데이터 가져오기
  }

  Future<void> _fetchWeatherRecommendationFromServer() async {
    final url =
        'https://weather-cloth-fastapi-807c88b6bcd8.herokuapp.com/weather_recommendation'; // FastAPI 서버 엔드포인트
    try {
      // HTTP GET 요청에 timeout 추가
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10)); // 10초 동안 응답이 없으면 에러 처리

      if (response.statusCode == 200) {
        // 상태 코드가 200인 경우(성공)
        final decodedBody =
            utf8.decode(response.bodyBytes); // UTF-8로 인코딩된 응답 바디를 디코딩
        final data = jsonDecode(decodedBody); // 응답 데이터 파싱
        setState(() {
          temperature = (data['temperature'] as num).toDouble(); // 온도 데이터 업데이트
          recommendationText = data['recommendation_text']; // 추천 텍스트 데이터 업데이트
          _updateImageBasedOnTemperature(temperature); // 온도에 따른 이미지 업데이트
        });
      } else {
        // 상태 코드가 200이 아닌 경우 사용자에게 오류 메시지를 표시
        _showErrorDialog('AI가 의상을 선정하는데 실패했어요 😅 \n 다시 한번만 시도해주세요🙏');
      }
    } catch (e) {
      // 요청 중에 예외가 발생한 경우 사용자에게 오류 메시지를 표시
      _showErrorDialog('AI가 의상을 선정하는데 실패했어요 😅 \n 다시 한번만 시도해주세요🙏');
    }
  }

  // 에러 메시지 표시
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        // 대화 상자 표시
        title: Text('오류 발생'), // 대화 상자 제목
        content: Text(message), // 대화 상자 내용
        actions: <Widget>[
          TextButton(
            // 대화 상자 버튼
            child: Text('확인'), // 버튼 텍스트
            onPressed: () {
              // 버튼 클릭 시 이벤트 처리
              Navigator.of(ctx).pop(); // 대화 상자를 닫습니다.
            },
          ),
        ],
      ),
    );
  }

  /*
  - 현재는 stable diffusion 으로 사전에 생성한 이미지를 사용해 이미지 종류가 제한적
  - 실제 개발단계에서는 AI 모델을 통해 이미지를 생성하고 사용하는 것도 고려해볼 수 있음
   */
  void _updateImageBasedOnTemperature(double? temp) {
    // 온도에 따른 이미지 업데이트 함수
    if (temp != null) {
      // 온도에 따른 이미지 경로 설정
      if (temp >= 28) {
        // 온도가 28도 이상인 경우
        _imagePath = 'assets/28_degree.png'; // 28도 이상 이미지로 변경
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // 앱바 타이틀 설정
          '☁ CIC OOTD ⛅',
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
        leading: Image.asset('assets/icon.png'), // 좌측상단의 아이콘을 이미지로 대체
        bottom: PreferredSize(
          // 앱바 하단에 그림자 효과를 주기 위해 PreferredSize 위젯을 추가
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
            mainAxisAlignment: MainAxisAlignment.center, // 세로 방향으로 중앙 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // 가로 방향으로 중앙 정렬
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5, // 이미지 높이 조절
                width: MediaQuery.of(context).size.width * 0.8, // 이미지 너비 조절
                child: Image.asset(
                  _imagePath,
                  fit: BoxFit.contain, // 이미지가 화면에 맞게 보이도록 설정
                ),
              ),
              SizedBox(height: 5), // 이미지와 텍스트 사이 간격
              Container(
                decoration: BoxDecoration(
                  // 컨테이너 배경색과 모서리 둥글게 설정
                  color: Colors.yellow, // 배경색 설정
                  borderRadius: BorderRadius.circular(10.0), // 모서리 둥글게 설정
                ),
                padding: EdgeInsets.all(16.0), // 컨테이너 안쪽 여백 설정
                child: Text(
                  recommendationText, // 추천 텍스트 표시
                  textAlign: TextAlign.center, // 가운데 정렬
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // 하단 앱바 설정
        child: Container(
          // 컨테이너 설정
          height: 60.0, // 컨테이너 높이 설정
          child: Center(
            // 하단 앱바 중앙에 버튼 배치
            child: IconButton(
              // 아이콘 버튼 추가
              icon: Icon(Icons.arrow_back), // 버튼 아이콘 설정(뒤로가기)
              onPressed: () {
                // 버튼 클릭 시 이벤트 처리
                Navigator.pop(context); // 현재 화면을 종료하고 이전 화면으로 돌아갑니다.
              },
            ),
          ),
        ),
      ),
    );
  }
}
