import 'package:dio/dio.dart';
import 'package:flutter_training/clean_architecture/data/mapper/task_mapper.dart';
import 'package:flutter_training/clean_architecture/data/repository/source/remote/api/task_api.dart';
import 'package:flutter_training/clean_architecture/data/repository/source/remote/task_remote_data_source.dart';
import 'package:flutter_training/clean_architecture/data/repository/task_repository_impl.dart';
import 'package:flutter_training/clean_architecture/domain/repository/task_repository.dart';
import 'package:flutter_training/clean_architecture/domain/usercase/get_task_usercase.dart';
import 'package:flutter_training/clean_architecture/presentation/pages/task/bloc/task_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpGetIt(){

  getIt.registerLazySingleton<TaskMapper>(() =>TaskMapper() ,);

  getIt.registerLazySingleton<TaskApi>(() {
    final dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/todos'));
    return TaskApi(dio);
  },);
  getIt.registerLazySingleton<TaskRemoteDataSource>(() => TaskRemoteDataSource(getIt<TaskApi>()));

  getIt.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl(getIt<TaskRemoteDataSource>(), getIt<TaskMapper>()),);

  getIt.registerLazySingleton<GetTaskUsercase>(() => GetTaskUsercase(getIt<TaskRepository>()),);

  getIt.registerFactory<TaskBloc>(() => TaskBloc(getIt<GetTaskUsercase>()),);
}