class Operators {
  int a = 8;
  int b = 5;
  int c = -10;

  void arithmetic(){
    print(a+b);
    print(a-b);
    print(a*b);
    print(a/b);
    print(a~/b);// trả về giá trị interger
    print(a%b);// trả về số dư
    print(a=b);
    print(a);
    print(b= a++);// gán vào b rồi tăng giá trị a
    print(b= ++a);// Tăng giá trị a và gán vào b
    print(c.abs()); // -expr
  }

  void compare(){
    print(a==b);// false
    print(a!=b);// true
    print(a>b);//false
    print(a<b);//true
    print(a>=b);//false
    print(a<=b);//true
  }

  void typeTest(){
    // kiểm tra is , as, is!
    print(a is int);// true
    print(a is! String);//true
  }

  void condition(){
    int check = a>b ? a : b;
    print(check);// true -> a, false-> b
    int? year;
    print(year ?? 2026);//year == null-> 2026
    print(year);// year = 2026(year ??= 2026)

    print(a<<=1);// nhân đôi a , >>=1 chia đôi
    print(a>>>=1);// thay đổi bit bên trái thêm 0 vào

    var list = [1,2,3];
    list
      ..add(4)
      ..add(5);
    print(list);
  }

  void logic(){
    bool isMonday = true;
    bool isTuesday = false;

    print(isMonday && isTuesday);
    print(isMonday || isTuesday);
  }

  void other(){
    String? value;
    print(value?.toLowerCase());//chấp nhận giá trị null
    List<int>? list;
    print(list?[0] ?? 26);
  }

  
}

void main() {
  Operators operators = Operators();
  // operators.arithmetic();
  // operators.compare();
  // operators.typeTest();
  // operators.condition();
  // operators.logic();
  operators.other();
}
