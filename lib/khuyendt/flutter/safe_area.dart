import 'package:flutter/material.dart';

class MySafeArea extends StatelessWidget {
  const MySafeArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sử dụng SafeArea để tránh các khu vực không an toàn như thanh trạng thái,các góc bo tròn và các phần khuyết của màn hình, v.v.
      body: SafeArea(
        // top: false, // vô hiệu hoá SafeArea ở trên cùng
        child: Container(
          color: Colors.amber,
          child: Text(
                'This text is within the safe area!',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
        ),
      ),
    );
  }
}