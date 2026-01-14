import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_training/clean_architecture/data/repository/source/local/drift/task_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'task_database.g.dart';

@DriftDatabase(tables: [TaskTable])
class TaskDatabase extends _$TaskDatabase {
  TaskDatabase() :super(_openConnection());

    @override
  int get schemaVersion => 1;

  Future<int> addTask(String title){
    return into(taskTable).insert(
      TaskTableCompanion.insert(title: title)
    );
  }

  Stream<List<TaskTableData>> getTask(){
    return select(taskTable).watch();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'task.db'));
    return NativeDatabase(file);
  });
}
