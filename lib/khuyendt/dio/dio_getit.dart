import 'package:flutter_training/khuyendt/dio/dio.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupGetIt(){
  locator.registerLazySingleton(() => ApiService());
}