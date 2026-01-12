import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_training/khuyendt/todo_remote/database/todo_table.dart';
import 'package:flutter_training/khuyendt/todo_remote/model/todo.dart' as model;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'todo_database.g.dart';

@DriftDatabase(tables: [TodoTable])
class TodoDatabase extends _$TodoDatabase {
  TodoDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> addTodo(List<model.Todo> todo) async {
    await batch((batch) {
      batch.insertAll(
        todoTable,
        todo
            .map(
              (e) => TodoTableCompanion.insert(
                title: e.title,
                userId: e.userId,
                id: e.id,
                completed: e.completed,
              ),
            )
            .toList(),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<List<TodoEntity>> getAllTodos() {
    return select(todoTable).get();
  }

  Future updateTodo(TodoEntity todo){
    return update(todoTable).replace(todo);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'todos.db'));
    return NativeDatabase(file);
  });
}
