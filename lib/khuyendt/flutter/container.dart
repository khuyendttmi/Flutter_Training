import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Container', style: TextStyle(fontWeight: FontWeight.bold)))),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              color: Colors.amber,
              constraints: BoxConstraints(
                maxHeight: 500,
                maxWidth: 400
              ),
              // alignment: Alignment.center,
              child: Text('Xin chao flutter nhoá', style: TextStyle(fontSize: 50),textDirection: TextDirection.ltr,textAlign: TextAlign.center,),
              
              
            ),
            // container được dùng để trang trí hoặc căn chỉnh một widget con
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(width: 3, color: Colors.black),
                shape: BoxShape.rectangle, // circle : borderRadius : null
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    spreadRadius: 3,
                    blurRadius: 30,
                    // offset: Offset(0, 4)
                  )
                ]
              ),
              alignment: Alignment(0, 0),// điều chỉnh vị trí theo toạ độ
              transform: Matrix4.rotationZ(1),
              child: Text('Container'),
            ),
            Container(
              color: Colors.green,
              child: SizedBox(
                width: 100,
                height: 100,
              ),
              
            ),
          ],
        ),
      )),
    );
  }
}
