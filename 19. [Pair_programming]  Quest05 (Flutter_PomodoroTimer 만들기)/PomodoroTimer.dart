import 'dart:async';

void main(List<String> args) {
  PomodoroTimer timer = PomodoroTimer(); // PomodoroTimer 클래스의 인스턴스 생성
  timer.start(); // 타이머 시작
}

class PomodoroTimer {
  int round = 1; // 현재 회차를 나타내는 변수, 초기값은 1
  // 각 상태별 시간 설정 (작업 시간, 휴식 시간, 4회차 휴식 시간)
  static const int work_duration = 25 * 60; // 작업 시간 25분
  static const int break_duration = 5 * 60; // 휴식 시간 5분
  static const int last_break_duration = 15 * 60; // 4회차 휴식 시간 15분

  int _current_duration = 0; // 현재 남은 시간 추적, 초기값은 0
  bool _is_working = true; // 현재 상태가 작업 중인지 여부를 나타내는 변수, 초기값은 작업 중(true)
  Timer? timer; // Timer 객체

  PomodoroTimer() {
    _current_duration = work_duration; // 타이머 생성시, 작업 시간으로 초기화
  }

  // 현재 회차 출력 메서드
  void printRound() {
    print('현재 회차: $round');
  }

  // 타이머 시작 메서드
  void start() {
    print('타이머를 시작합니다.');
    printRound(); // 현재 회차 출력

    // 1초마다 반복되는 타이머 설정
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_current_duration > 0) {
        // 남은 시간이 있을 경우
        print(
            'flutter: ${_current_duration ~/ 60}:${_current_duration % 60}'); // 남은 시간 출력
        _current_duration--; // 남은 시간 1초 감소
      } else {
        // 남은 시간이 없을 경우 (0초)
        if (_is_working) {
          // 현재 상태가 작업 중인 경우
          if (round % 4 == 0)
            _current_duration = last_break_duration; // 4회차일 경우 긴 휴식 시간 설정
          else
            _current_duration = break_duration; // 그 외 회차일 경우 일반 휴식 시간 설정

          _is_working = false; // 상태를 휴식으로 전환
          print('작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.');
        } else {
          // 현재 상태가 휴식 중인 경우
          _current_duration = work_duration; // 작업 시간 재설정

          _is_working = true; // 상태를 작업으로 전환
          print('휴식 시간이 종료되었습니다. 작업 시간을 시작합니다.');
          round++; // 회차 증가
          if (round < 5) printRound(); // 5회차 이전이면 새 회차 출력
        }
      }

      if (round == 5) timer.cancel(); // 5회차가 되면 타이머 종료
    });
  }
}
