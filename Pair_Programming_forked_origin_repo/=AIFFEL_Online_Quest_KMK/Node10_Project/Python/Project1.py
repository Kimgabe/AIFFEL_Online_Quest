# 

class Project1:
    def __init__(self):
        self.square = int(input('넓이를 구하고 싶은 사각형의 숫자를 써주세요.\n 1.평행사변형 2.사다리꼴 \n >>>'))
        self.warning = "올바른 번호를 입력해주세요."

        if self.square == 1 :
            print("평행사변형 함수는 par()입니다.")
        elif self.square == 2 :
            print('사다리꼴 함수는 trape()입니다.')
        else :
            print(self.warning)

    def par(self) :
        par_init = True
        while par_init :
            self.width, self.height = map(int, input("너비 높이순으로 입력해주세요>>").split())
            par_init = False
        
        return f"평행사변형의 넓이는 {self.width*self.height}입니다."
    
    def tra(self) :
        tra_init = True
        while tra_init :
            self.top_width, self.bottom_width, self.height = map(int, input("윗변, 아랫변, 높이순으로 입력해주세요>>").split())
            tra_init = False
        
        return f"사다리꼴의 넓이는 {(self.top_width+self.bottom_width)*self.height/2}입니다."

sample = Project1()
sample.par()
sample.tra()
