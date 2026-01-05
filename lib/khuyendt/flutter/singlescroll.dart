import 'package:flutter/material.dart';

class Singlescroll extends StatelessWidget {
  const Singlescroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'SingleChildScrollView',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: 500,
          // dùng nó khi layout cố định nhưng nội dung bên trong dài hơn kích thước màn hình thức tế
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 100,
                  ),
                  Container(
                    color: Colors.amber,
                    width: double.infinity,
                    height: 100,
                  ),
                  Container(
                    color: Colors.blue,
                    width: double.infinity,
                    height: 100,
                  ),
                  Container(
                    color: Colors.redAccent,
                    width: double.infinity,
                    height: 100,
                  ),
                  Container(
                    color: Colors.green,
                    width: double.infinity,
                    height: 100,
                  ),
                  Container(
                    color: Colors.lightBlueAccent,
                    width: double.infinity,
                    height: 100,
                  ),
                  Container(
                    color: Colors.amber,
                    width: double.infinity,
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
