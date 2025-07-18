// 2024년 02월 01일 양희, 영현, 강훈 조...

import 'dart:async';

//Timer.periodic은 일정한 주기로 반복되는 타이머를 생성하는 Dart의 클래스입니다.
//이 타이머는 일정한 시간 간격으로 콜백 함수를 호출하여 주어진 작업을 수행합니다.
//주로 주기적인 작업이나 반복적인 동작이 필요한 상황에서 사용됩니다.

// class를 만들건데 Start와 break, end 를 만들어서 서로 불러오는 개념을 만들거에요 왜냐 start가 끝나면 start가 끝났다라는것을 받고 break가 자동으로 실행 되어야함
// 작업 초단위로 계속 세주어야함 하지만 우리는 1초로하죠 감소방식
// count가 == 4일때 breakPomodoro가 15분으로 증가해야되어야함.
// 그게 계속 반복되면서 count가 4회 이상 즉 5번이되었을때 endPomodoro class가 실행되서 종료되는거까지 해야함

// class Start
//  시작 메세지 출력
// start가 끝나면 start가 끝났다는 메세지 받기 -> break 자동 실행
// 타이머 도는 시간 25분
class StartPomodoro {
  static const int starttime = 1500; //second로 실행되지만 출력물은 min과 sec로 계산하여 출력함
  static const int breaktime = 300; // 이하 동일
  static const int longbreaktime = 900; // 이하 동일
  static int count = 0;

  int remainingTime;
  StartPomodoro(this.remainingTime);

  void StartTimer() {
    print(
        "Pomodoro 타이머를 시작합니다. - ${remainingTime ~/ 60}분 동안 작업을 실시합니다."); // 소수점 버림 나누기 연산자 사용
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      // 초단위로 시간을 감소하기
      print(
          'flutter: ${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}'); // 초단위가 이상하게 나와서 2자리 수 맞춰주기 위해 사용
      if (remainingTime == 0) {
        print('작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.');
        timer.cancel();
        count += 1; // 4번 동안 공부할 경우 장기휴식 및 종료하기 위해 count += 1 추가
        if (count < 4) {
          BreakTimer();
        } else {
          LongBreakTimer();
        }
      } else {
        remainingTime--;
      }
    });
  }

// class Breaktime
// 1~3회차 휴식 시간 5분 -> break 끝나면 start 자동 실행
  void BreakTimer() {
    remainingTime = StartPomodoro.breaktime;
    print("휴식 타이머를 시작합니다. - ${remainingTime ~/ 60}분 동안 작업을 실시합니다.");
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      print(
          'flutter: ${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}');
      if (remainingTime == 0) {
        print("휴식 타이머가 종료 되었습니다. 다시 시작합니다.");
        timer.cancel();
        remainingTime = StartPomodoro
            .starttime; // 초기화를 시키지 않으면 0초로 진행되기 ㄸ때문에 다시 class에 있던 정수값을 이용하여 초기화
        if (count < 4) {
          StartTimer();
        } else {
          LongBreakTimer();
        }
      } else {
        remainingTime--;
      }
    });
  }

// class LongBreaktime
// 1~3회차 휴식 시간 5분 -> break 끝나면 start 자동 실행
  void LongBreakTimer() {
    remainingTime = StartPomodoro.longbreaktime;
    print("휴식 시작 타이머를 시작합니다. - ${remainingTime ~/ 60}분 동안 작업을 실시합니다.");
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      print(
          'flutter: ${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}');
      if (remainingTime == 0) {
        print("공부가 종료되었습니다.");
        timer.cancel();
        End();
      } else {
        remainingTime--;
      }
    });
  }

  void End() {
    print("끝!");
  }
}

main() {
  print("포모도로 타이머 지금 시작합니다.");
  StartPomodoro pomo = StartPomodoro(StartPomodoro.starttime);
  pomo.StartTimer();
}


//회고 최강훈 : 포모도로 타이머를 만드는데도 이렇게 코드가 길다는것에 놀랐고, 휴식시간이 끝나고 다시 시작 했을때 0초가 나와서 다시 시간을 초기화를 해주었다.
//              K - Timer.periodic에 대해 알아보았다. (필요한 것에 대해 알아보았다.)
//              P - 휴식 시간 종료 후 다시 공부시간이 0초에 머물렀었음
//              T - remainingTime을 다시 StartPomodoro의 객체로 초기화를 시켜주었음

//회고 김양희 : 배운 개념을 적용하는 것이 어려웠다. 전체적인 구조를 다시 잡아보고, 적용해볼 만한 개념을 찾아보고 타이머를 다시 만들어 봐야겠다.

//회고 강영현 :  K - 잘 한 게 없는 것 같아서 다음에 keep할 행동을 만들어야 겠다.
//              P - 아직 다트가 덜 숙지되어 있었다.
//              T - 진도를 더 나간 게 문제가 된 것 같아서, 주말에 얼른 진도를 빼야겠다