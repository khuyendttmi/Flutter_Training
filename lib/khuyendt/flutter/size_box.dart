import 'package:flutter/material.dart';

class MySizedBox extends StatelessWidget {
  const MySizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ràng buộc kịch thước cho child
                SizedBox( 
                  width: 100,
                  height: 100,
                  child: Card(child: Center(child: Text('Hello sizedBox', textAlign: TextAlign.center,))),
                ),
                SizedBox(height: 10),// làm khoảng cách
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.amber,
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Lắp đầy container này'),
                    ),
                  ),
                ),
                SizedBox.shrink(
                  // child: ElevatedButton(
                  //   onPressed: () {},
                  //   child: Text('Lắp đầy container này'),
                  // ),
                ),// Thu nhỏ đến biến mất
                SizedBox(height: 10,),
                SizedBox.fromSize(
                  size: const Size(200, 50),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text('SizeBox fromSize'),
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
