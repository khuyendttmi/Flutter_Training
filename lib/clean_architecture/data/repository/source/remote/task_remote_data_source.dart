
import 'package:flutter_training/clean_architecture/data/model/task_data.dart';
import 'package:flutter_training/clean_architecture/data/repository/source/remote/api/task_api.dart';

class TaskRemoteDataSource {
  final TaskApi _taskApi;

  TaskRemoteDataSource(this._taskApi);

  Future<List<TaskData>> getTasks()async{
    final response = await _taskApi.getTodos();
    return response;
  }
  
}