import 'package:flutter_training/clean_architecture/data/mapper/base_mapper.dart';
import 'package:flutter_training/clean_architecture/data/model/task_data.dart';
import 'package:flutter_training/clean_architecture/domain/entities/task.dart';

// chuyển đổi dữ liệu data qua domain
class TaskMapper extends BaseMapper<TaskData, Task> {
  @override
  Task map(TaskData data) {
    return Task(id: data.id, title: data.title, completed: data.completed);
  }

  List<Task> mapList(List<TaskData> data) {
    return data
        .map((e) => Task(id: e.id, title: e.title, completed: e.completed))
        .toList();
  }
}
