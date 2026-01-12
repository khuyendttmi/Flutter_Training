import 'package:dio/dio.dart';
import 'package:flutter_training/khuyendt/todo_remote/model/todo.dart' show Todo;
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'todo_api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/todos')
abstract class TodoApi {
   factory TodoApi(Dio dio) = _TodoApi;

  @GET('/')
  Future<List<Todo>> getTodos();

   @GET('/{id}')
  Future<Todo> getTodo();
}