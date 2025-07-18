#!/usr/bin/env python
# coding: utf-8

# > # 사각형 클래스 만들기

# In[1]:


class Square:
    def __init__(self):  # 생성자__init__의 매개변수의 첫번째는 self여야 합니다. 
        self.square = int(input('넓이를 구하고 싶은 사각형의 숫자를 써주세요.\n 1.직사각형 2.평행사변형 3.사다리꼴 \n >>>'))  # 입력값을 int로 묶어야 합니다.

        if self.square == 1:
            print('직사각형 함수는 rect()입니다.')  # Square 클래스에 rect() 메서드를 추가합니다. 

        elif self.square == 2:
            print('평행사변형 함수는 par()입니다.')  # Square 클래스에 par() 메서드를 추가합니다.  
        
        elif self.square == 3:
            print('사다리꼴 함수는 trape()입니다.')  # Square 클래스에 trape() 메서드를 추가합니다. 
        
        else:
            print('1, 2, 3 중에서 다시 입력해주세요')


# In[2]:


# split()함수 예시 2
a, b, c = '모.두.연'.split('.')
print(b)


# In[3]:


가로, 세로 = input('가로, 세로를 입력하세요. 예시 : 가로,세로').split(',')
print(가로, 세로)


# In[4]:


type(가로)


# In[5]:


# 3,4를 입력해보세요

가로, 세로 = map(int,input('가로, 세로를 입력하세요. 예시 : 가로,세로').split(','))
print(가로, type(가로))


# In[6]:


# 3,4를 입력해보세요

가로, 세로 = map(int,input('가로, 세로를 입력하세요. 예시 : 가로,세로').split(','))
print(가로, type(가로))
print(세로, type(세로))


# In[7]:


def rect(self):  # 직사각형의 넓이를 구하는 메서드
    width, vertical = map(int, input('가로, 세로를 입력하세요. 예시 : 가로,세로\n >>>').split(','))  #가로, 세로를 입력받는 코드
    area = width * vertical  # 넓이를 구하는 부분
    result = '직사각형의 넓이는 : ' + str(area)
    return result


# In[8]:


a = Square()


# In[9]:


a.rect()


# In[10]:


# 클래스 만들기 
class Square:
    def __init__(self):
        self.square = int(input('넓이를 구하고 싶은 사각형의 숫자를 써주세요.\n 1.직사각형 2.평행사변형 3.사다리꼴 \n >>>'))

        if self.square == 1:
            print('직사각형 함수는 rect()입니다.')

        elif self.square == 2:
            print('평행사변형 함수는 par()입니다.')
        
        elif self.square == 3:
            print('사다리꼴 함수는 trape()입니다.')
        
        else:
            print('1, 2, 3 중에서 다시 입력해주세요')


    def rect(self):
        width, vertical = map(int, input('가로, 세로를 입력하세요. 예시 : 가로,세로\n >>>').split(','))
        area = width * vertical
        result = '직사각형의 넓이는 : ' + str(area)
        return result


# In[11]:


a = Square()


# In[12]:


a.rect()


# In[13]:


# 문제 1. 평행사변형과 사다리꼴의 넓이를 구하는 메서드를 구현해봅시다. 

# 평행사변형 메서드
def par(self):
    base, height = map(int, input('밑변, 높이를 입력하세요.').split(','))
    area = base * height
    return areat
    
# 사다리꼴 메서드
def trape(self):
    base, lower_base, height = map(int, input('밑변, 아랫변, 높이를 입력하세요.').split(','))
    area = height * (base + lower_base) * 0.5
    return result


# In[23]:


# 사각형 넓이를 구하는 클래스 완성!
class Square:
    def __init__(self):
        self.square = int(input('넓이를 구하고 싶은 사각형의 숫자를 써주세요.\n 1.직사각형 2.평행사변형 3.사다리꼴 \n >>>'))

        if self.square == 1:
            print('직사각형 함수는 rect()입니다.')

        elif self.square == 2:
            print('평행사변형 함수는 par()입니다.')
        
        elif self.square == 3:
            print('사다리꼴 함수는 trape()입니다.')
        
        else:
            print('1, 2, 3 중에서 다시 입력해주세요')
    
    #직사각형 매서드
    def rect(self):
        width, vertical = map(int, input('가로, 세로를 입력하세요. 예시 : 가로,세로\n >>>').split(','))
        area = width * vertical
        result = '직사각형의 넓이는 : ' + str(area)
        return result

    # 평행사변형 메서드
    def par(self):
        base, height = map(int, input('밑변, 높이를 입력하세요.').split(','))
        area = base * height
        result = '평행사변형의 넓이는 : '+ str(area)
        return area
    
    # 사다리꼴 메서드
    def trape(self):
        base, lower_base, height = map(int, input('밑변, 아랫변, 높이를 입력하세요.').split(','))
        area = height * (base + lower_base) * 0.5
        result = '사다리꼴의 넓이는 : '+ str(area)
        return result

a = Square()  # 객체 생성 & 2, 3을 각각 입력해 봅시다.


# In[22]:


a.par()


# In[16]:


a.trape()


# > # 키오스크 만들기

# In[17]:


# 커피 메뉴와 가격
coffee = ['americano', 'latte', 'mocha'] 
c_price = [2000, 3000, 3000]

# 논커피 메뉴와 가격
non_coffee = ['yuza_tea', 'green_tea', 'choco_latte']
n_price = [2500, 2500, 3000]


# In[18]:


# 전체 메뉴와 가격 
menu = ['americano', 'latte', 'mocha', 'yuza_tea', 'green_tea', 'choco_latte']
price = [2000, 3000, 3000, 2500, 2500, 3000]


# In[19]:


non_coffee_menu = menu[3:]
non_coffee_price = price[3:]

print('논커피 메뉴 : ', non_coffee_menu)
print('논커피 메뉴 가격 : ', non_coffee_price)


# In[20]:


# 논커피 메뉴와 가격을 출력해보세요.
coffee_menu = dict(zip(coffee, c_price))
non_coffee_menu = dict(zip(non_coffee, n_price))

non_coffee_menu


# In[31]:


# 문제 2-1. Kiosk 클래스를 생성합니다. 

class Kiosk:
    def __init__(self):
        self.menu = ['americano', 'latte', 'mocha', 'yuza_tea', 'green_tea', 'choco_latte']
        self.price = [2000, 3000, 3000, 2500, 2500, 3000]


# In[32]:


a = Kiosk()
a.menu


# In[33]:


#가격
a.price


# > ## 메뉴판 출력

# In[36]:


class Kiosk: 
    # 문제 2-1의 답을 입력하세요.     
    def __init__(self):
        self.menu = ['americano', 'latte', 'mocha', 'yuza_tea', 'green_tea', 'choco_latte']
        self.price = [2000, 3000, 3000, 2500, 2500, 3000]

# 메뉴 출력 메서드
    def menu_print(self):
        for i in range(len(self.menu)):
            print(i+1, self.menu[i], ' : ', self.price[i], '원')


# In[37]:


a = Kiosk()  # 객체 생성 
a.menu_print()  # 메뉴 출력


# > ## 주문

# In[38]:


# 문제 2-2. 주문 메서드  
# 음료의 이름과 가격을 출력하세요.  

def menu_select(self):
    n = int(input("음료의 번호를 입력하세요 : "))  # 음료 번호 입력
    self.price_sum = self.price[n-1]  # 선택 음료의 가격
    # 문제 2-2. 음료의 이름과 가격을 출력하세요.
    print(self.menu[n-1], ' : ', self.price_sum, '원')  # 메뉴


# - 음료를 주문받는 코드
# - 음료의 번호를 잘못 입력할 수도 있으니 예외 처리도 추가

# In[39]:


# 주문 메서드   
def menu_select(self):
    n = 0
    while n < 1 or len(menu) < n:
        n = int(input("음료 번호를 입력하세요 : "))  # 음료 번호 입력
    
        # 메뉴판에 있는 음료 번호일 때
        if 1 <= n & n <= len(menu):
            self.price_sum = self.price[n-1]  # 선택 음료의 가격
            # 문제 2-2의 답을 입력하세요. 
            print(self.menu[n-1], ' : ', self.price_sum, '원')  # 메뉴
    
        # 메뉴판에 없는 번호일 때
        else:
            print("없는 메뉴입니다. 다시 주문해 주세요.")


# - 메뉴판에 없는 메뉴를 시킬 때의 예외 처리를 if-else문으로 처리

# In[40]:


class Kiosk:    
    def __init__(self):
        # 문제 2-1의 답을 입력하세요. 
        self.menu = ['americano', 'latte', 'mocha', 'yuza_tea', 'green_tea', 'choco_latte']
        self.price = [2000, 3000, 3000, 2500, 2500, 3000]

    # 메뉴 출력 메서드
    def menu_print(self):
        for i in range(len(self.menu)):
            print(i+1, self.menu[i], ' : ', self.price[i], '원')

    # 주문 메서드
    def menu_select(self):
        print()  # 줄 바꿈
        n = 0
        while n < 1 or len(menu) < n:
            n = int(input("음료 번호를 입력하세요 : "))  # 음료 번호 입력

            # 메뉴판에 있는 음료 번호일때
            if 1 <= n & n <= len(menu):
                self.price_sum = self.price[n-1]  # 선택 음료의 가격
                # 문제 2-2의 답을 입력하세요. 
                print(self.menu[n-1], ' : ', self.price_sum, '원')  # 메뉴
        
             # 메뉴판에 없는 번호일 때
            else:  
                print("없는 메뉴입니다. 다시 주문해 주세요.")


# In[41]:


# 아메리카노 주문해보기  
a = Kiosk()  # 객체 생성 
a.menu_print()  # 메뉴 출력
a.menu_select()  # 아메리카노 주문


# In[58]:


# 문제 2-3. 주문 메서드      

# 음료의 온도에 따라 temp 변수를 "HOT" 또는 "ICE"로 지정하세요.

class Kiosk: 
    def __init__(self):
        # 문제 2-1의 답을 입력하세요. 
        self.menu = ['americano', 'latte', 'mocha', 'yuza_tea', 'green_tea', 'choco_latte']
        self.price = [2000, 3000, 3000, 2500, 2500, 3000]

    # 메뉴 출력 메서드
    def menu_print(self):
        for i in range(len(self.menu)):
            print(i + 1, self.menu[i], ' : ', self.price[i], '원')

    # 주문 메서드
    def menu_select(self):
        print()  # 줄 바꿈
        n = 0
        while n < 1 or len(menu) < n:
            n = int(input("음료 번호를 입력하세요 : "))  # 음료 번호 입력

            # 메뉴판에 있는 음료 번호일때
            if 1 <= n & n <= len(menu):
                self.price_sum = self.price[n-1]  # 선택 음료의 가격
        
            # 메뉴판에 없는 번호일 때
            else:  
                print("없는 메뉴입니다. 다시 주문해 주세요.")

        # 음료 온도 물어보기
        t = 0  # 기본값을 넣어주고
        while t != 1 and t != 2:  # 1이나 2를 입력할 때까지 물어보기
            t= int(input("HOT 음료는 1을, ICE 음료는 2를 입력하세요 : "))
            # 문제 2-3. 음료의 온도에 따라 temp 변수를 "HOT" 또는 "ICE"로 지정하세요.   
            # 힌트: if문을 활용해보세요.        
            if t == 1:
                self.temp = "HOT"
            elif t == 2:
                self.temp = "Ice"  
            else:    
                print("1과 2 중 하나를 입력하세요.\n")
        # 문제 2-2의 답을 입력하세요. 
        print('주문 음료', self.temp, self.menu[n-1], ' : ', self.price_sum, '원')  # 온도 속성을 추가한 주문 결과 출력


# In[61]:


# 아이스 초코라떼 주문해보기  
a = Kiosk()  # 객체 생성
a.menu_print()  # 메뉴 출력
a.menu_select()


# ## 추가 주문
# 
# 손님에게 추가 주문을 할 것인지 물어보고, 추가 주문을 하지 않고 주문 금액을 지불하려면 0을 눌러서 주문이 완료
# while n != 0 문으로 추가 주문을 반복해서 물어봅시다.
# 
# 그에 해당하는 가격도 가격 리스트(self.oreder_price)에 추가
# 
# - self.order_menu = []  # 주문 리스트
# - self.order_price = []  # 가격 리스트
# - self.order_price.append(self.price[n-1])  # 가격 리스트에 추가
# - self.order_menu.append(self.temp + ' ' + self.menu[n-1])  # 주문 리스트에 추가
# 

# In[114]:


# 문제 2-4. 추가 주문       
# 추가 음료의 온도를 입력받고, 가격 리스트와 주문 리스트, 합계 금액을 업데이트합니다. 

def menu_select(self):
    self.order_menu = []  # 주문 리스트
    self.order_price = []  # 가격 리스트

    n = 0
    while n < 1 or len(menu) < n:
        n = int(input("음료를 번호를 입력하세요 : "))  # 음료 번호 입력

        # 메뉴판에 있는 음료 번호일 때
        if 1 <= n & n <= len(menu):
            self.order_price.append(self.price[n-1])  # 가격 리스트에 추가합니다.
            self.price_sum = self.price[n-1]  # 합계 금액
        
            # 메뉴판에 없는 번호일 때
        else:  
            print("없는 메뉴입니다. 다시 주문해 주세요.")


    # 음료 온도 물어보기
    t = 0  # 기본값을 넣어주고
    while t != 1 and t != 2:  # 1이나 2를 입력할 때까지 물어보기
        t= int(input("HOT 음료는 1을, ICE 음료는 2를 입력하세요 : "))
        # 문제 2-3의 답을 입력하세요. 
        if t == 1:
            self.temp = "HOT"
        elif t == 2:
            self.temp = "Ice"  
        else:    
            print("1과 2 중 하나를 입력하세요.\n")

    self.order_menu.append(self.temp + ' ' + self.menu[n-1])  # 주문 리스트에 추가합니다.
    # 문제 2-2의 답을 입력하세요. 
    print(self.temp, self.menu[n-1], ' : ', self.price_sum, '원')  # 온도 속성을 추가한 주문 결과를 출력합니다.

    # 추가 주문 또는 지불
    while n != 0:  # 지불을 선택하기 전까지 반복합니다.
        print()  # 줄 바꾸면서 
        n = int(input("추가 주문은 음료 번호를, 지불은 0을 누르세요 : "))  # 추가 주문 또는 지불
        if n > 0 and n < len(self.menu) + 1: 
            # 추가 음료 온도 
            # 문제 2-4. 추가 음료의 온도를 입력받고, 가격 리스트, 주문 리스트, 합계 금액을 업데이트해보세요.
            if t == 1:
                self.temp = "HOT"
            elif t == 2:
                self.temp = "ICE"
            self.order_price.append(self.price[n-1])
            self.price_sum += self.price[n-1]
            self.order_menu.append(self.temp + '' + self.menu[n-1])
            print('추가 주문 음료', self.temp, self.menu[n-1], ':', self.price[n-1], '원\n', '합계 : ', self.price_sum, '원')
        else :
            if n == 0 :  # 지불을 입력하면
                print("주문이 완료되었습니다.")
                print(self.order_menu, self.order_price)  # 확인을 위한 리스트를 출력합니다.
            else :  # 없는 번호를 입력할 때
                print("없는 메뉴입니다. 다시 주문해 주세요.")


# In[115]:


Kiosk.menu_select = menu_select


# In[117]:


# 5가지 이상의 음료를 주문하고 리스트 확인하기 
a = Kiosk()  # 객체 생성
a.menu_print()  # 메뉴 출력
a.menu_select()  # 주문


# # 지불
# 
# - 주문이 완료되었다면 지불을 해야 합니다. 지불(pay) 메서드에는 지불할 금액을 출력
# - 현금을 선택하면 직원을 호출하겠습니다.라고 출력하고 카드를 선택하면 IC칩 방향에 맞게 카드를 꽂아주세요.를 출력하는 메서드

# - 현금('cash' or 1) → '직원을 호출하겠습니다.'  
# - 카드('card' or 2) → 'IC칩 방향에 맞게 카드를 꽂아주세요.'  
# 
# 
# 1이나 2 외의 다른 번호를 선택했을 경우에는 다시 결제를 시도해 주세요.라는 메시지가 나오는 예외 처리

# In[131]:


# 문제 3-1. 지불 메서드
# 위의 설명을 참고하여 pay 함수를 구현합니다. 

def pay(self):
    print(f"지불할 금액은{self.price_sum} 원 입니다.")
    p = 0
    while p != 1 and p != 2:
        p = int(input('현금은 1번, 카드는 2번을 선택해주세요 : '))
        if p == 1:
            print("직원을 호출하겠습니다.")
        elif p == 2:
            print("IC칩 방향에 맞게 카드를 꽃아주세요.")
        else:
            print("다시 결제를 시도해주세요.")


# In[132]:


# 문제 2-3. 주문 메서드      

# 음료의 온도에 따라 temp 변수를 "HOT" 또는 "ICE"로 지정하세요.

class Kiosk: 
    def __init__(self):
        # 문제 2-1의 답을 입력하세요. 
        self.menu = ['americano', 'latte', 'mocha', 'yuza_tea', 'green_tea', 'choco_latte']
        self.price = [2000, 3000, 3000, 2500, 2500, 3000]

    # 메뉴 출력 메서드
    def menu_print(self):
        for i in range(len(self.menu)):
            print(i + 1, self.menu[i], ' : ', self.price[i], '원')

    # 주문 메서드
    def menu_select(self):
        print()  # 줄 바꿈
        n = 0
        while n < 1 or len(menu) < n:
            n = int(input("음료 번호를 입력하세요 : "))  # 음료 번호 입력

            # 메뉴판에 있는 음료 번호일때
            if 1 <= n & n <= len(menu):
                self.price_sum = self.price[n-1]  # 선택 음료의 가격
        
            # 메뉴판에 없는 번호일 때
            else:  
                print("없는 메뉴입니다. 다시 주문해 주세요.")

        # 음료 온도 물어보기
        t = 0  # 기본값을 넣어주고
        while t != 1 and t != 2:  # 1이나 2를 입력할 때까지 물어보기
            t= int(input("HOT 음료는 1을, ICE 음료는 2를 입력하세요 : "))
            # 문제 2-3. 음료의 온도에 따라 temp 변수를 "HOT" 또는 "ICE"로 지정하세요.   
            # 힌트: if문을 활용해보세요.        
            if t == 1:
                self.temp = "HOT"
            elif t == 2:
                self.temp = "Ice"  
            else:    
                print("1과 2 중 하나를 입력하세요.\n")
        # 문제 2-2의 답을 입력하세요. 
        print('주문 음료', self.temp, self.menu[n-1], ' : ', self.price_sum, '원')  # 온도 속성을 추가한 주문 결과 출력# 문제 2-4. 추가 주문       
 # 추가 음료의 온도를 입력받고, 가격 리스트와 주문 리스트, 합계 금액을 업데이트합니다. 

    def menu_select(self):
        self.order_menu = []  # 주문 리스트
        self.order_price = []  # 가격 리스트

        n = 0
        while n < 1 or len(menu) < n:
            n = int(input("음료를 번호를 입력하세요 : "))  # 음료 번호 입력

            # 메뉴판에 있는 음료 번호일 때
            if 1 <= n & n <= len(menu):
                self.order_price.append(self.price[n-1])  # 가격 리스트에 추가합니다.
                self.price_sum = self.price[n-1]  # 합계 금액
        
                # 메뉴판에 없는 번호일 때
            else:  
                print("없는 메뉴입니다. 다시 주문해 주세요.")


        # 음료 온도 물어보기
        t = 0  # 기본값을 넣어주고
        while t != 1 and t != 2:  # 1이나 2를 입력할 때까지 물어보기
            t= int(input("HOT 음료는 1을, ICE 음료는 2를 입력하세요 : "))
            # 문제 2-3의 답을 입력하세요. 
            if t == 1:
                self.temp = "HOT"
            elif t == 2:
                self.temp = "Ice"  
            else:    
                print("1과 2 중 하나를 입력하세요.\n")

        self.order_menu.append(self.temp + ' ' + self.menu[n-1])  # 주문 리스트에 추가합니다.
        # 문제 2-2의 답을 입력하세요. 
        print(self.temp, self.menu[n-1], ' : ', self.price_sum, '원')  # 온도 속성을 추가한 주문 결과를 출력합니다.

        # 추가 주문 또는 지불
        while n != 0:  # 지불을 선택하기 전까지 반복합니다.
            print()  # 줄 바꾸면서 
            n = int(input("추가 주문은 음료 번호를, 지불은 0을 누르세요 : "))  # 추가 주문 또는 지불
            if n > 0 and n < len(self.menu) + 1: 
                # 추가 음료 온도 
                # 문제 2-4. 추가 음료의 온도를 입력받고, 가격 리스트, 주문 리스트, 합계 금액을 업데이트해보세요.
                if t == 1:
                    self.temp = "HOT"
                elif t == 2:
                    self.temp = "ICE"
                self.order_price.append(self.price[n-1])
                self.price_sum += self.price[n-1]
                self.order_menu.append(self.temp + '' + self.menu[n-1])
                print('추가 주문 음료', self.temp, self.menu[n-1], ':', self.price[n-1], '원\n', '합계 : ', self.price_sum, '원')
            else :
                if n == 0 :  # 지불을 입력하면
                    print("주문이 완료되었습니다.")
                    print(self.order_menu, self.order_price)  # 확인을 위한 리스트를 출력합니다.
                else :  # 없는 번호를 입력할 때
                    print("없는 메뉴입니다. 다시 주문해 주세요.")

    def pay(self):
        print(f"지불할 금액은{self.price_sum} 원 입니다.")
        p = 0
        while p != 1 and p != 2:
            p = int(input('현금은 1번, 카드는 2번을 선택해주세요 : '))
            if p == 1:
                print("직원을 호출하겠습니다.")
            elif p == 2:
                print("IC칩 방향에 맞게 카드를 꽃아주세요.")
            else:
                print("다시 결제를 시도해주세요.")
                
    


# In[133]:


Kiosk.pay = pay


# In[134]:


a = Kiosk()  # 객체 생성 
a.menu_print()  # 메뉴 출력
a.menu_select()  # 주문
a.pay()  # 지불


# # 주문표
# 
# 주문표에는 주문한 전체 상품명과 각 금액과 총 주문 금액을 출력해야 합니다. 주문 리스트와 가격 리스트에서 하나씩 꺼내서 나열하면 가능할 것 같습니다. 주문 내역이 아래와 같을 때 가상의 주문표를 만들어 보겠습니다.

# In[135]:


order = ['HOT americano', 'ICE latte', 'ICE mocha', 'ICE choco_latte'] 
price = [2000, 3000, 3000, 3000] 

# 외곽
print('⟝' + '-' * 30 + '⟞')
for i in range(5):
    print('|' + ' ' * 31 + '|')

# 주문 상품명 : 해당 금액
for i in range(len(order)):
    print(order[i], ' : ', price[i])

print('합계 금액 :', sum(price))

# 외곽
for i in range(5):
    print('|' + ' ' * 31+ '|')
print('⟝' + '-' * 30 + '⟞')


# 먼저 외곽선을 그리고, order 리스트의 length만큼 반복문으로 상품명과 해당 금액을 인덱싱을 이용해 모두 출력합니다. 그 후 sum() 함수로 모든 주문 금액을 더해서 합계 금액을 나타내줍니다.
# 마지막으로 주문표를 완성하는 외곽을 다시 그립니다.
# 
# 주문표를 출력하는 메서드를 직접 작성해 봅시다. 클래스 안에 포함된 table() 메서드에 위의 내용을 담아 코드를 작성해보세요.

# In[153]:


# 문제 3-2. 주문표 
# 위의 주문표 코드를 참고하여 table() 메서드를 작성해 봅니다. 

def table(self):
    #외곽
    print('⟝' + '-' * 30 + '⟞')
    for i in range(5):
        print('|' + ' ' * 31 + '|')
        
    for i in range(len(self.order_menu)):
        print(self.order_menu[i], ' : ', self.order_price[i], '원')
        
    print('합계 금액 :', sum(price))
    
    for i in range(5):
        print('|' + ' ' * 31+ '|')
    print('⟝' + '-' * 30 + '⟞')


# In[164]:


# 문제 3-3. 클래스 업데이트  
# 앞에서 구현했던 메서드들을 Kiosk 클래스에 추가합니다. 직접 코드를 작성해 보세요! 

class Kiosk: 
    def __init__(self):
        # 문제 2-1의 답을 입력하세요. 
        self.menu = ['americano', 'latte', 'mocha', 'yuza_tea', 'green_tea', 'choco_latte']
        self.price = [2000, 3000, 3000, 2500, 2500, 3000]

    # 메뉴 출력 메서드
    def menu_print(self):
        for i in range(len(self.menu)):
            print(i + 1, self.menu[i], ' : ', self.price[i], '원')

    # 주문 메서드
    def menu_select(self):
        print()  # 줄 바꿈
        n = 0
        while n < 1 or len(menu) < n:
            n = int(input("음료 번호를 입력하세요 : "))  # 음료 번호 입력

            # 메뉴판에 있는 음료 번호일때
            if 1 <= n & n <= len(menu):
                self.price_sum = self.price[n-1]  # 선택 음료의 가격
        
            # 메뉴판에 없는 번호일 때
            else:  
                print("없는 메뉴입니다. 다시 주문해 주세요.")

        # 음료 온도 물어보기
        t = 0  # 기본값을 넣어주고
        while t != 1 and t != 2:  # 1이나 2를 입력할 때까지 물어보기
            t= int(input("HOT 음료는 1을, ICE 음료는 2를 입력하세요 : "))
            # 문제 2-3. 음료의 온도에 따라 temp 변수를 "HOT" 또는 "ICE"로 지정하세요.   
            # 힌트: if문을 활용해보세요.        
            if t == 1:
                self.temp = "HOT"
            elif t == 2:
                self.temp = "Ice"  
            else:    
                print("1과 2 중 하나를 입력하세요.\n")
        # 문제 2-2의 답을 입력하세요. 
        print('주문 음료', self.temp, self.menu[n-1], ' : ', self.price_sum, '원')  
        
    #추가 메뉴 선택
    def menu_select(self):
        self.order_menu = []  # 주문 리스트
        self.order_price = []  # 가격 리스트

        n = 0
        while n < 1 or len(menu) < n:
            n = int(input("음료를 번호를 입력하세요 : "))  # 음료 번호 입력

            # 메뉴판에 있는 음료 번호일 때
            if 1 <= n & n <= len(menu):
                self.order_price.append(self.price[n-1])  # 가격 리스트에 추가합니다.
                self.price_sum = self.price[n-1]  # 합계 금액
        
                # 메뉴판에 없는 번호일 때
            else:  
                print("없는 메뉴입니다. 다시 주문해 주세요.")


        # 음료 온도 물어보기
        t = 0  # 기본값을 넣어주고
        while t != 1 and t != 2:  # 1이나 2를 입력할 때까지 물어보기
            t= int(input("HOT 음료는 1을, ICE 음료는 2를 입력하세요 : "))
            # 문제 2-3의 답을 입력하세요. 
            if t == 1:
                self.temp = "HOT"
            elif t == 2:
                self.temp = "Ice"  
            else:    
                print("1과 2 중 하나를 입력하세요.\n")

        self.order_menu.append(self.temp + ' ' + self.menu[n-1])  # 주문 리스트에 추가합니다.
        # 문제 2-2의 답을 입력하세요. 
        print(self.temp, self.menu[n-1], ' : ', self.price_sum, '원')  # 온도 속성을 추가한 주문 결과를 출력합니다.

        # 추가 주문 또는 지불
        while n != 0:  # 지불을 선택하기 전까지 반복합니다.
            print()  # 줄 바꾸면서 
            n = int(input("추가 주문은 음료 번호를, 지불은 0을 누르세요 : "))  # 추가 주문 또는 지불
            if n > 0 and n < len(self.menu) + 1: 
                # 추가 음료 온도 
                # 문제 2-4. 추가 음료의 온도를 입력받고, 가격 리스트, 주문 리스트, 합계 금액을 업데이트해보세요.
                if t == 1:
                    self.temp = "HOT"
                elif t == 2:
                    self.temp = "ICE"
                self.order_price.append(self.price[n-1])
                self.price_sum += self.price[n-1]
                self.order_menu.append(self.temp + '' + self.menu[n-1])
                print('추가 주문 음료', self.temp, self.menu[n-1], ':', self.price[n-1], '원\n', '합계 : ', self.price_sum, '원')
            else :
                if n == 0 :  # 지불을 입력하면
                    print("주문이 완료되었습니다.")
                    print(self.order_menu, self.order_price)  # 확인을 위한 리스트를 출력합니다.
                else :  # 없는 번호를 입력할 때
                    print("없는 메뉴입니다. 다시 주문해 주세요.")
    
    #지불
    def pay(self):
        print(f"지불할 금액은{self.price_sum} 원 입니다.")
        p = 0
        while p != 1 and p != 2:
            p = int(input('현금은 1번, 카드는 2번을 선택해주세요 : '))
            if p == 1:
                print("직원을 호출하겠습니다.")
            elif p == 2:
                print("IC칩 방향에 맞게 카드를 꽃아주세요.")
            else:
                print("다시 결제를 시도해주세요.")
    
    #주문서 출력            
    def table(self):
        #외곽
        print('⟝' + '-' * 30 + '⟞')
        for i in range(5):
            print('|' + ' ' * 31 + '|')
        
        for i in range(len(self.order_menu)):
            print(self.order_menu[i], ' : ', self.order_price[i], '원')
        
        print('합계 금액 :', sum(price))
    
        for i in range(5):
            print('|' + ' ' * 31+ '|')
        print('⟝' + '-' * 30 + '⟞')


# In[166]:


a = Kiosk()  # 객체 생성 
a.menu_print()  # 메뉴 출력
a.menu_select()  # 주문
a.pay()  # 지불
a.table()  # 주문표 출력


# # 에ㅔㅔㅔ쓰ㅡㅡㅡ 🍒

# In[ ]:




