import 'package:flutter_training/khuyendt/built_in_types.dart';

class Variables {
// giá trị có thể thay đổi,
  var name = 'Khuyen DT';
  var age = 22;

//Giá trị chỉ được gán 1 lần,
//Giá trị trong object(mutable) có thể thay đổi được
  final user = 'Khuyen'; 
  // user = 'khuyen'; Lỗi khi gán lại giá trị
  final List<String> listName = ['Name1', 'Name2', 'Name3'];

//const ở cấp class phải khai báo static
//Giá trị không thể thay thế được
  static const typeInt = '12';
  static const isBooling = 'True';
  static const listInt = [1,2,3,4];

// bất kì giá trị nào cũng có thể khai báo hằng số
  var foo = const [];
  final bar = const [];
  static const baz = [];

  late String address;
  void setAddress(){
    address = 'Da Nang';
  }

  late List<int> listIntNumber;
  setListInt(){
    listIntNumber = [1,2,3,4];
    return listIntNumber;
  }

// Cho phép gán giá trị sau
  late bool isBool;
}

void main() {
  Variables variables = Variables();

  variables.age = 23;
  print( 'user : ${variables.user} - age ${variables.age}' );

  variables.listName.add('Khuyen');
  for (var element in variables.listName) {
    print(element);
  }

  BuiltInTypes builtInTypes = BuiltInTypes();
  print(builtInTypes.hi);


}
