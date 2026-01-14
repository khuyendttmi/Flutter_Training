import 'package:flutter_training/clean_architecture/domain/entities/task.dart';
import 'package:flutter_training/clean_architecture/domain/repository/task_repository.dart';

class CreateTaskUsercase {
  final TaskRepository taskRepository;

  CreateTaskUsercase(this.taskRepository);

  Future<void> call(Task task) {
    return taskRepository.createTask(task);
  }
}
