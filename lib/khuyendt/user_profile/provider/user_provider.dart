import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/khuyendt/user_profile/get_it/log_service.dart';
import 'package:flutter_training/khuyendt/user_profile/get_it/service_locator.dart';
import 'package:flutter_training/khuyendt/user_profile/model/user.dart';
import 'package:flutter_training/khuyendt/user_profile/remote/user_api.dart';
import 'package:flutter_training/khuyendt/user_profile/repository/user_repository.dart';
import 'package:flutter_training/khuyendt/user_profile/storage/local_storage.dart';
import 'package:riverpod/legacy.dart';

class UserNotifier extends StateNotifier<User?> {
  final Ref ref;
  final logger = getIt<LogService>();

  UserNotifier(this.ref) : super(null);

  Future<void> saveUser(int id) async {
    final user = await ref.read(userRepositoryProvider).getUserProfile(id);
    state = user;
    logger.log('Lưu thông tin thành công');
  }

  Future<void> loadUser() async {
    final user = await ref.read(userRepositoryProvider).getLocalUser();
    state = user;
  }

  void logout() {
    state = null;
    ref.read(userRepositoryProvider).removeUser();
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User?>(
  (ref) => UserNotifier(ref),
);
final dioProvider = Provider<Dio>(
  (ref) => Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com')),
);

final userApiProvider = Provider<UserApi>(
  (ref) => UserApi(ref.read(dioProvider)),
);

final localStorageProvider = Provider<LocalStorage>((ref) => LocalStorage());

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepository(
    api: ref.read(userApiProvider),
    storage: ref.read(localStorageProvider),
  ),
);
