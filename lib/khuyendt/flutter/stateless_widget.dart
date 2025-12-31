import 'package:flutter/material.dart';

//StatelessWidget: không đổi trạng thái, không thay đổi dữ liệu, là một class tĩnh
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello StatelessWidget',
          style: TextStyle(color: Colors.amber, fontSize: 30, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
