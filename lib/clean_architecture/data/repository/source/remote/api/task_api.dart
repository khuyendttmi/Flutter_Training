
import 'package:dio/dio.dart';
import 'package:flutter_training/clean_architecture/data/model/task_data.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'task_api.g.dart';

@RestApi()
abstract class TaskApi {
  factory TaskApi(Dio dio) = _TaskApi;

  @GET('/')
  Future<List<TaskData>> getTodos();


}