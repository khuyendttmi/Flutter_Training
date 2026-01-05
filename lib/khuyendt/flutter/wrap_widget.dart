import 'package:flutter/material.dart';

class MyWrap extends StatelessWidget {
  const MyWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Wrap',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Wrap(
            direction: Axis.horizontal,// xếp theo hàng ngang
            // direction: Axis.vertical, xếp theo hàng dọc
            spacing: 10,
            runSpacing: 10.5,
            textDirection: TextDirection.rtl, // xuống phải , ltr: xuống trái
            verticalDirection: VerticalDirection.up,// xuống trên hay dưới
            children: [
              Container(
                color: Colors.amber,
                constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
                // alignment: Alignment.center, căn theo toạ độ
                child: Text(
                  'Xin chao flutter nhoá',
                  style: TextStyle(fontSize: 50),
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                ),
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
                    ),
                  ],
                ),
                alignment: Alignment(0, 0), // điều chỉnh vị trí theo toạ độ
                child: Text('Container'),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      'https://cdnphoto.dantri.com.vn/biDybasem0PXE92oigzoXSOmbzo=/thumb_w/1280/2020/03/03/thanhbinh-1-a-3-docx-1583197236401.jpeg',
                    ),
                  ),
                ),
                child: SizedBox(width: 100, height: 100),
              ),
              Container(width: 100, height: 100, color: Colors.blue,),
            ],
          ),
        ),
      ),
    );
  }
}
