import 'package:dio/dio.dart';
import 'package:flutter_training/khuyendt/dio/user_dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<UserDio>> getUser() async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/users',
    );
    final data = response.data as List<dynamic>;

    return data.map((e) => UserDio.fromJson(e)).toList();
  }
}
