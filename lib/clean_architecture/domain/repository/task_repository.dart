import 'dart:ffi';
import 'package:flutter_training/clean_architecture/domain/entities/task.dart';

// repository là nơi chức các chức năng giao tiếp với tần data layer để lấy dữ liệu
abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<Task> createTask(Task task);
  Future<Bool> isExistTask(String title);
}
