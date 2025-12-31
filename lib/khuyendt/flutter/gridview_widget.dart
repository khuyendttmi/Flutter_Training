import 'package:flutter/material.dart';

class GridviewWidget extends StatelessWidget {
  const GridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'GridView',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              // giống GridView.extent: tự tính toán các cột 
              // SliverGridDelegateWithFixedCrossAxisCount: quy định sẵn số cột
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150, // mỗi ô rộng tối đa
                mainAxisSpacing: 10, // khoảng cách hàng
                crossAxisSpacing: 10, //khoảng cách cột
                childAspectRatio: 1 // tỉ lệ ô vuông
              ),
              children: List.generate(8, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.green.shade500,
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
