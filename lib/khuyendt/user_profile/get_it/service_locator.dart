
import 'package:flutter_training/khuyendt/user_profile/get_it/log_service.dart';
import 'package:get_it/get_it.dart';

// getIt: rút ngắn quá trình truyền dữ liệu giữa các controller
final getIt = GetIt.instance;

void setupLocator(){
  getIt.registerLazySingleton<LogService>(() => LogService());
}