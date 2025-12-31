import 'package:flutter/material.dart';

class MySafeArea extends StatelessWidget {
  const MySafeArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // sử dụng SafeArea để tránh các khu vực không an toàn như thanh trạng thái,các góc bo tròn và các phần khuyết của màn hình, v.v.
      body: SafeArea(
        // top: false, // vô hiệu hoá SafeArea ở trên cùng
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Text(
                'Văn bản này nằm trong vùng an toàn!',
                style: TextStyle(color: Colors.redAccent, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
