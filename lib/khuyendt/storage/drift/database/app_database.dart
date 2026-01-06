import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'todo_table.dart';

part 'app_database.g.dart';

// cơ sở dữ liệu quan hệ , dùng để lưu các dữ liệu lớn theo table Entities
@DriftDatabase(tables: [Todos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // INSERT
  Future<int> addTodo(String title) {
    return into(todos).insert(
      TodosCompanion.insert(title: title),
    );
    
  }

  // READ
  Stream<List<Todo>> watchTodos() {
    return select(todos).watch();
  }

  Future updateTodo(Todo todo){
    return update(todos).replace(todo);
  }

  Future deleteTodo(int id){
    return (delete(todos)..where((tbl) => tbl.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'app.db'));
    return NativeDatabase(file);
  });
}
