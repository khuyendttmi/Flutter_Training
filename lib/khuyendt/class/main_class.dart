import 'package:flutter_training/khuyendt/class/emun.dart';
import 'package:flutter_training/khuyendt/class/person.dart';
import 'package:flutter_training/khuyendt/class/student_class.dart';

void main(){
  Student student = Student(name: 'Nguyen Van A', age: 20);
  student.studentInfo();
  User user = User('123 ABC Street', 123456789);
  user.logInfo();
  student.eat();
  student.sleep(); 
  user.doHomework();
  Gender gender = Gender.female;
  print('Đồng phục: ${gender.description}');
  student.totleGPA();
  
}