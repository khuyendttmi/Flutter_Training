import 'package:flutter_training/khuyendt/todo_remote/database/todo_database.dart';
import 'package:flutter_training/khuyendt/todo_remote/model/todo.dart' as model;
import 'package:flutter_training/khuyendt/todo_remote/remote/todo_api.dart';

class TodoRespository {
  final TodoApi api;
  final TodoDatabase db;

  TodoRespository({required this.api, required this.db});

  Future<void> saveTodos() async {
    try {
      final List<model.Todo> todos = await api.getTodos();
      final getTenTodos = todos.take(20).toList();
      db.addTodo(getTenTodos);
    } catch (e) {
      print('Lỗi ${e.toString()}');
    }
  }

  Future<List<TodoEntity>> getTodos() async {
    return db.getAllTodos();
  }

  Future updateTodo(TodoEntity todo) async {
    db.updateTodo(todo);
  }
}
