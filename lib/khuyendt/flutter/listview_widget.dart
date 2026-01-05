import 'package:flutter/material.dart';

class ListviewWidget extends StatelessWidget {
  const ListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'ListView',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expanded(
                  //   child: ListView(
                  //     children: [
                  //       Container(color: Colors.amber, width: 100, height: 100),
                  //       Container(color: Colors.blue, width: 100, height: 100),
                  //       Container(
                  //         color: Colors.redAccent,
                  //         width: 100,
                  //         height: 100,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Item $index'),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 300,
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Item $index'),
                    );
                  },
                  separatorBuilder: (context, position) {
                    return Card(
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Separator $position',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
