<aside>
🔑 **PRT(Peer Review Template)**  
    
- 코더 : 김양희, 강영현, 최강훈    
- 리뷰어 : 이선재

- [X]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요?**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 근거로 첨부
**1. 크게 작업시간과 휴식시간으로 구분됩니다.**
```
    포모도로 타이머 지금 시작합니다.
    Pomodoro 타이머를 시작합니다. - 0분 동안 작업을 실시합니다.
    flutter: 0:02
    flutter: 0:01
    flutter: 0:00
    작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.
    휴식 타이머를 시작합니다. - 0분 동안 작업을 실시합니다.
    flutter: 0:02
    flutter: 0:01
    flutter: 0:00
    휴식 타이머가 종료 되었습니다. 다시 시작합니다.
    Pomodoro 타이머를 시작합니다. - 0분 동안 작업을 실시합니다.
    flutter: 0:02
    flutter: 0:01
    flutter: 0:00
    작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.
    휴식 타이머를 시작합니다. - 0분 동안 작업을 실시합니다.
    flutter: 0:02
    flutter: 0:01
    flutter: 0:00
    휴식 타이머가 종료 되었습니다. 다시 시작합니다.
    Pomodoro 타이머를 시작합니다. - 0분 동안 작업을 실시합니다.
    flutter: 0:02
    flutter: 0:01
    flutter: 0:00
    작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.
    휴식 타이머를 시작합니다. - 0분 동안 작업을 실시합니다.
    flutter: 0:02
    flutter: 0:01
    flutter: 0:00
    휴식 타이머가 종료 되었습니다. 다시 시작합니다.
    Pomodoro 타이머를 시작합니다. - 0분 동안 작업을 실시합니다.
    flutter: 0:02
    flutter: 0:01
    flutter: 0:00
    작업 시간이 종료되었습니다. 휴식 시간을 시작합니다.
    휴식 시작 타이머를 시작합니다. - 0분 동안 작업을 실시합니다.
    flutter: 0:01
    flutter: 0:00
    공부가 종료되었습니다.
    끝!

```

[리뷰] 시간 관계 상, 시간을 줄여서 테스트를 진행했고, 깔끔하게 결과가 잘 추력되는 것을 확인했다.  


**2. 25분 작업, 5분 휴식을 한 회차로 판단합니다.**  

```
    static const int starttime = 1500; //second로 실행되지만 출력물은 min과 sec로 계산하여 출력함
    static const int breaktime = 300; // 이하 동일
    static const int longbreaktime = 900; // 이하 동일

    if (count < 4) {
      BreakTimer();
    } else {
      LongBreakTimer();
    }
```
[리뷰] 회차 연산이 잘 수행되는 것을 확인했다.  

** 단, 4회차는 25분 작업, 15분 휴식을 진행합니다.**  

```
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
```
[리뷰] 4회차는 별도로 지정한 시간만큼 카운트가 되는 것을 확인했다.  
---
    
- [X]  **2. 전체 코드에서 가장 핵심적이거나 가장 복잡하고 이해하기 어려운 부분에 작성된 
주석 또는 doc string을 보고 해당 코드가 잘 이해되었나요?**
    - 해당 코드 블럭에 doc string/annotation이 달려 있는지 확인
    - 해당 코드가 무슨 기능을 하는지, 왜 그렇게 짜여진건지, 작동 메커니즘이 뭔지 기술.
    - 주석을 보고 코드 이해가 잘 되었는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
```
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
```
[리뷰] 타이머의 가장 핵심적인 부분에 대한 주석이 작성되어 있다.  
---
        
- [X]  **3. 에러가 난 부분을 디버깅하여 문제를 “해결한 기록을 남겼거나” 
”새로운 시도 또는 추가 실험을 수행”해봤나요?**
    - 문제 원인 및 해결 과정을 잘 기록하였는지 확인 또는
    - 문제에서 요구하는 조건에 더해 추가적으로 수행한 나만의 시도, 
    실험이 기록되어 있는지 확인
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
```
    flutter: ${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}'); // 초단위가 이상하게 나와서 2자리 수 맞춰주기 위해 사용
```
[리뷰] 시간 연산에서의 오차를 분석하여 해결한 기록을 확인했다.  
---
        
- [X]  **4. 회고를 잘 작성했나요?**
    - 주어진 문제를 해결하는 완성된 코드 내지 프로젝트 결과물에 대해
    배운점과 아쉬운점, 느낀점 등이 상세히 기록되어 있는지 확인
```
    //회고 최강훈 : 포모도로 타이머를 만드는데도 이렇게 코드가 길다는것에 놀랐고, 휴식시간이 끝나고 다시 시작 했을때 0초가 나와서 다시 시간을 초기화를 해주었다.
    //              K - Timer.periodic에 대해 알아보았다. (필요한 것에 대해 알아보았다.)
    //              P - 휴식 시간 종료 후 다시 공부시간이 0초에 머물렀었음
    //              T - remainingTime을 다시 StartPomodoro의 객체로 초기화를 시켜주었음
    
    //회고 김양희 : 배운 개념을 적용하는 것이 어려웠다. 전체적인 구조를 다시 잡아보고, 적용해볼 만한 개념을 찾아보고 타이머를 다시 만들어 봐야겠다.
    
    //회고 강영현 :  K - 잘 한 게 없는 것 같아서 다음에 keep할 행동을 만들어야 겠다.
    //              P - 아직 다트가 덜 숙지되어 있었다.
    //              T - 진도를 더 나간 게 문제가 된 것 같아서, 주말에 얼른 진도를 빼야겠다
```
[리뷰] 팀원 모두의 퀘스트에 대한 회고가 작성되어 있는 것을 확인했다.  
---

- [X]  **5. 코드가 간결하고 효율적인가요?**
    - 코드 중복을 최소화하고 범용적으로 사용할 수 있도록 모듈화(함수화) 했는지
        - 잘 작성되었다고 생각되는 부분을 근거로 첨부합니다.
```
    void StartTimer() {}
    void BreakTimer() {}
    void LongBreakTimer() {}
```
[리뷰] 각 기능들을 함수로 묶어 모듈화를 진행한 것을 확인 했다.
</aside>
