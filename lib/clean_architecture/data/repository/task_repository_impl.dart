import 'dart:ffi';

import 'package:flutter_training/clean_architecture/data/mapper/task_mapper.dart';
import 'package:flutter_training/clean_architecture/data/repository/source/remote/task_remote_data_source.dart';
import 'package:flutter_training/clean_architecture/domain/entities/task.dart';
import 'package:flutter_training/clean_architecture/domain/repository/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _taskRemoteDataSource;
  final TaskMapper _taskMapper;

  TaskRepositoryImpl(this._taskRemoteDataSource, this._taskMapper);

  @override
  Future<Task> createTask(Task task) {
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getTasks() async{
    final tasks = await _taskRemoteDataSource.getTasks();
    return _taskMapper.mapList(tasks);
  }

  @override
  Future<Bool> isExistTask(String title) {
    throw UnimplementedError();
  }
}
