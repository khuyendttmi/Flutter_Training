import 'package:flutter/material.dart';

class ExpandWidget extends StatelessWidget {
  const ExpandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Expand',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text(
                      'widget',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                // Chiếm các phần còn lại
                Expanded(
                  child: Container(
                    color: Colors.amber,
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text(
                        'widget',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.redAccent,
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text(
                      'widget',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 1, // số phần mở rộng
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text(
                        'widget',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // Chiếm các phần còn lại
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.amber,
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text(
                        'widget',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.redAccent,
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text(
                        'widget',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
