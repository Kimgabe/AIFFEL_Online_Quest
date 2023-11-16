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
        idx_select_init = True
        idx_menu = 0
        self.select_menu = []
        self.select_price = []

        while idx_select_init :
            print()
            idx_menu = int(input("음료 번호를 입력하세요(메뉴조회 0) >> "))

            if idx_menu == 0 :
                self.menu_print()
                continue

            if 1 <= idx_menu <= len(self.menu) :
                idx_temp = 0
                while idx_temp not in [1, 2] :
                    idx_temp = int(input("HOT이면 1, ICE면 2를 선택해주세요 >> "))
                    
                    if idx_temp in [1,2] :
                        self.select_price.append(self.price[idx_menu-1])
                        self.select_menu.append(f"{self.temp[idx_temp-1]} {self.menu[idx_menu-1]}")
                        print(f"{self.select_menu[-1]} {self.select_price[-1]}원 주문 추가되어 현재 총 {sum(self.select_price)}원입니다.")
                    else :
                        print("올바른 번호 입력해주세요!")
                        print()
            else :
                print("올바른 번호 입력해주세요!")
                print()
                continue
            
            more_idx = int(input("더 주문하시겠습니까? 예:1 아니오:0 >> "))
            if more_idx == 1 :
                continue
            else :
                print(f"{', '.join(self.select_menu)} 해서 총 {sum(self.select_price)}원 결제 도와드리겠습니다.")
                idx_select_init = False

    def pay(self) :
        idx_pay = ""
        while idx_pay not in ['1', '2', 'cash', 'card'] :
            print()
            idx_pay = input("결제는 어떻게 도와드릴까요? [예시] (현금)cash or 1, (카드)card or 2 >> ")

            if idx_pay in ['1', 'cash'] :
                print("감사합니다. 직원을 호출하겠습니다.")
            elif idx_pay in ['2', 'card'] :
                print("IC칩 방향에 맞게 카드를 꽂아주세요.")
            else :
                print('다시 결제를 시도해 주세요.')
                continue
            
    def table(self) :
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