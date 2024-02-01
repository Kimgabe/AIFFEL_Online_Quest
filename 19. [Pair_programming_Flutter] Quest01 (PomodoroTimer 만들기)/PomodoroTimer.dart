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

/* 
회고

KEEP
* 로직의 흐름을 팀원과 정리를 하며 퀘스트를 진행하였다.
* 코드 복붙 없이 생으로 다 만들었다.
PROBLEM
* 로직을 구성하는 기술이 부족하다.
* 문제 이해력이 아직 부족하여 팀원의 의견을 이해하는데 시간이 걸린다.
TRY
* 스스로 예제를 만들어 로직을 구현하는 연습을 해야겠다.
* 커뮤니케이션 연습을 해야겠다.
*/



/* 
회고 (김승순)

KEEP
- 처음에 어떻구현할지 구조에 대해서 논의하고, 중간 중간 확인하면서 코딩해서 시행착오가 적었다.
- 커뮤니케이션을 적절하게 잘 해서 서로의 이해도를 맞추고, 이해한 내용에 대해서 논의 하면서 퀘스트를 진행했다.

PROBLEM
- 코딩 적인 부분에서 아직 언어에 대한 이해도가 낮아서 직접 코딩하는 시간보다는 말로 부탁하는 시간이 많았다.
- 특히 {} 나 () 의 레벨을 맞추고 적절한 위치에 코드를 입력하는 것에 어려움이 많았다.

TRY
- 언어의 구조나 메서드 등에 대한 이해를 높이기 위해 여러번 사용하면서 이해를 높여야겠다.
*/