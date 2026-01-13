import 'dart:ffi';
import 'package:flutter_training/clean_architecture/domain/entities/task.dart';
import 'package:flutter_training/clean_architecture/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  @override
  Future<Task> createTask(Task task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasks() {
    // TODO: implement getTasks
    throw UnimplementedError();
  }

  @override
  Future<Bool> isExistTask(String title) {
    // TODO: implement isExistTask
    throw UnimplementedError();
  }


}