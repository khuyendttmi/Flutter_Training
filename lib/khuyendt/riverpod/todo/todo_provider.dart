import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/khuyendt/riverpod/todo/todo_model.dart';
import 'package:riverpod/legacy.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void add(String title) {
    final todo = Todo(
      id: Random().nextDouble().toInt(),
      title: title,
      completed: false,
    );
    state = [...state, todo];// lắng nghe
  }

  void toggleTodo(int id) {
    state =
        state.map((todo) {
          if (todo.id == id) {
            return todo.copyWith(completed: !todo.completed);
          }
          return todo;
        }).toList();
  }

  void removeTodo(int id){
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>(
  (ref) => TodoNotifier(),
);

final todoFutureProvider = FutureProvider<TodoNotifier>((ref) => TodoNotifier(),);
