class Project2_kiosk:
    def __init__(self) :
        self.menu = ['아메리카노', '카페라떼', '카페모카', '바닐라라떼', '초코라떼', '얼그레이']
        self.price = [2000, 4000, 4500, 4800, 4800, 4000]
        self.temp = ['HOT', 'ICE']
    
    def menu_print(self) :
        print("="*22)
        print(" "*9 + "메뉴" + " "*9)
        print("="*22)
        idx = 0
        for i, j in zip(self.menu, self.price) :
            idx += 1
            print(f"{idx}. {i} : {j}원")
        print("="*22)

    def menu_select(self) :
        print()
        self.idx_select_init = True
        self.idx_menu = 0
        self.select_menu = []
        self.select_price = []

        while self.idx_select_init :
            print()
            self.idx_menu = int(input("음료 번호를 입력하세요(메뉴조회 0) >> "))

            # 메뉴 조회시 다시 input 실행
            if self.idx_menu == 0 :
                self.menu_print()
                continue

            # 원하는 온도 받기
            if 1 <= self.idx_menu <= len(self.menu) :
                self.idx_temp = 0
                while self.idx_temp not in [1, 2] :
                    self.idx_temp = int(input("HOT이면 1, ICE면 2를 선택해주세요 >> "))
                    
                    if self.idx_temp in [1,2] :
                        self.select_price.append(self.price[self.idx_menu-1])
                        self.select_menu.append(f"{self.temp[self.idx_temp-1]} {self.menu[self.idx_menu-1]}")
                        print(f"{self.select_menu[-1]} {self.select_price[-1]}원 주문 추가되어 현재 총 {sum(self.select_price)}원입니다.")
                    else :
                        print("올바른 번호 입력해주세요!")
                        print()
            else :
                print("올바른 번호 입력해주세요!")
                print()
                continue
            
            # 추가 주문 여부
            self.more_idx = int(input("더 주문하시겠습니까? 예:1 아니오:이 외 숫자 >> "))
            if self.more_idx == 1 :
                continue
            else :
                print(f"{', '.join(self.select_menu)} 해서 총 {sum(self.select_price)}원 결제 도와드리겠습니다.")
                self.idx_select_init = False

    def pay(self) :
        # 지불방법 선택
        self.idx_pay = ""
        while self.idx_pay not in ['1', '2', 'cash', 'card', '-1'] :
            print()
            self.idx_pay = input("결제는 어떻게 도와드릴까요? [예시] (현금)cash or 1, (카드)card or 2 [-1은 취소] >> ")

            if self.idx_pay in ['1', 'cash'] :
                print("감사합니다. 직원을 호출하겠습니다.")
            elif self.idx_pay in ['2', 'card'] :
                print("IC칩 방향에 맞게 카드를 꽂아주세요.")
            elif self.idx_pay == "-1" :
                print("주문을 취소하겠습니다.")
            else :
                print('다시 결제를 시도해 주세요.')
                continue
            

    def table(self) :
        if self.idx_pay != "-1" :
            print()
            print("="*24)
            print(" "*8 + "주문표" + " "*8)
            print("="*24)
            for i in range(len(self.select_menu)):
                print(f"{i+1}. {self.select_menu[i]} : {self.select_price[i]}")
            print("="*24)


sample = Project2_kiosk()
sample.menu_print()
sample.menu_select()
sample.pay()
sample.table()
