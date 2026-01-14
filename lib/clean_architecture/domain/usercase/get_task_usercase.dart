import 'package:flutter_training/clean_architecture/domain/entities/task.dart';
import 'package:flutter_training/clean_architecture/domain/repository/task_repository.dart';

// các business rule , nơi mình đặt ra yêu cầu
class GetTaskUsercase {

  final TaskRepository taskRepository;

  GetTaskUsercase(this.taskRepository);

  Future<List<Task>> call() async{
    return await taskRepository.getTasks();
  }

}