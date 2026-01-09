import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/khuyendt/todo_remote/database/todo_database.dart';
import 'package:flutter_training/khuyendt/todo_remote/remote/todo_api.dart';
import 'package:flutter_training/khuyendt/todo_remote/repository/todo_respository.dart';

class TodoPageRemote extends StatefulWidget {
  const TodoPageRemote({super.key});

  @override
  State<TodoPageRemote> createState() => _TodoPageRemoteState();
}

class _TodoPageRemoteState extends State<TodoPageRemote> {
  late final TodoApi api;
  late final TodoDatabase db;
  late final TodoRespository respository;
  List<TodoEntity> todos = [];

  @override
  void initState() {
    super.initState();
    api = TodoApi(
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')),
    );
    db = TodoDatabase();
    respository = TodoRespository(api: api, db: db);
    _initDate();
  }

  Future<void> _initDate() async {
    await respository.saveTodos();
    await respository.getTodos().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Todos With Drift',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return ListTile(
                    title: Text('Công việc ${todo.id}'),
                    leading: Checkbox(
                      value: todo.completed,
                      onChanged: (value) {
                        final updateCompleted = todo.copyWith(
                          completed: value ?? false,
                        );
                        respository.updateTodo(updateCompleted);
                        setState(() {
                          todos[index] = updateCompleted;
                        });
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  final todo = todos[index];
                  return Card(
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        todo.title,
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
    );
  }
}
