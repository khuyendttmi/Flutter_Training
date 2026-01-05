
import 'package:flutter_training/khuyendt/class/abstract.dart';
import 'package:flutter_training/khuyendt/class/interface.dart';
import 'package:flutter_training/khuyendt/class/mixin.dart';

//subclass
class Student extends Person  with Study implements StudentInterface {

  Student({required super.name, required super.age});

  @override
  void eat(){
    print('Ăn cơm ở căn tin');
  }
  
  @override
  void sleep() {
    print('Ngày ngủ 12 tiếng');
  }

  void studentInfo(){
    print('Student(name: $name, age: $age)');
  }

  void doHomework(){
    doMath();
  }
  
  // Phương thức, object bắt buộc phải thực hiện và override lại
  @override
  void totleGPA() {
    print('Tổng điểm GPA của sinh viên là 3.5');
  }

}