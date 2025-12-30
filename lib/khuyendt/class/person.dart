import 'package:flutter_training/khuyendt/class/mixin.dart';
import 'package:flutter_training/khuyendt/class/student_class.dart';

class User extends Student with Study {
  String address;
  int phoneNumber;

  User(this.address, this.phoneNumber):super(age: 18, name: 'Dao Van A');// kế thừa student

  // method
  void logInfo(){
    print('$address - sdt: $phoneNumber');
  }

  void learnMath(){
    doMath();
  }
}