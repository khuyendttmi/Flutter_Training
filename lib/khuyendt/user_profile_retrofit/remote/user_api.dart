import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../model/user.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @GET('/users/{id}')
  Future<User> getUser (@Path('id') int id);
}
