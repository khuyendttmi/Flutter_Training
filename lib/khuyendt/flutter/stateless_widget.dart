import 'package:flutter/material.dart';

//StatelessWidget: không đổi trạng thái, không thay đổi dữ liệu, là một class tĩnh
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text('Hello StatelessWidget', style: TextStyle(color: Colors.amber),),
      ),
    )
    ;
  }
}