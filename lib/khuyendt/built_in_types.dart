class BuiltInTypes {
  int a = 23;
  void interger() {
    print(a.runtimeType); // in ra kiểu interger
  }

  // Kiểu số thực
  double realType = 3.3;
  var point = 5.4;
  void typeNumber() {
    print(point.runtimeType);
  }

  // Kiểu chuổi
  String name = 'Khuyen';
  String hello =
      'Hello '
      ' khuyen';

  // Trả về dữ liệu đúng hoặc sai
  bool isBool = true;
  bool isCheck = false;

  // Runes
  var hi = 'hi \u{1f606}';

  var list = [1, 'name1', 3.3];
  List<int> listInt = [1, 2, 3];
  List<String> strString = ['str1', 'str2', 'str3'];

  // Tập hợp kiểu Set<String> không được trùng dữ liệu
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};

  Map<int, String> nobleGases = {2: 'helium', 10: 'neon', 18: 'argon'};
  Map<String, int> nobleGases1 = {'helium': 2, 'neon': 10, 'argon': 18};

  var addKeyValue = {'key': 'Khuyen'};
  void addKey() {
    addKeyValue['key2'] = 'Khuyen2';
    assert(addKeyValue.length == 2);
  }

  // Không cần gán giá trị ban đầu,
  // Kiểu dữ liệu có thể thay đổi được
  dynamic num1 = 'kdt1';
  dynamic num2;
  void dynamicNumber() {
    num1 = 12;
  }

  // Có thể gán kiểu dữ liệu khác nhau nếu a chưa khai báo trước đó
  void typeVariable() {
    var a;
    print(a.runtimeType);
    a = 3;
    print(a.runtimeType);
    a = 'string';
    print(a.runtimeType);
  }

  // Dùng cho tất cả kiểu dữ liệu
  Object objString = 'Hello';
  Object objInt = 123;
}

void main() {
  BuiltInTypes builtInTypes = BuiltInTypes();
  builtInTypes.interger(); // in ra kiểu số nguyên
  builtInTypes.typeNumber();

  // Chuyển int -> string
  int age = 22;
  String strAge = age.toString();
  print(strAge.runtimeType);

  // Chuyển string -> double
  String strDouble = '9.5';
  print(double.parse(strDouble).runtimeType);

  builtInTypes.listInt.add(10);
  builtInTypes.listInt.remove(2);
  builtInTypes.listInt.insert(2,22);
  print(builtInTypes.runtimeType);
  for (var element in builtInTypes.listInt) {
    print(element);
  }

}
