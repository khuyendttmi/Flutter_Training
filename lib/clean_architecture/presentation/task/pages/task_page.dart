import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clean Architecture')),
      body: Column(
        children: [
          ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: Checkbox(value: false, onChanged: (value) {}),
                title: Text('Item $index'),
                leading: IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn",
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
