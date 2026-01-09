import 'package:flutter_training/khuyendt/user_profile/model/user.dart'
    show User;
import 'package:flutter_training/khuyendt/user_profile/remote/user_api.dart';
import 'package:flutter_training/khuyendt/user_profile/storage/local_storage.dart';

class UserRepository {
  final UserApi api;
  final LocalStorage storage;

  UserRepository({required this.api, required this.storage});

  Future<User> getUserProfile(int id) async {
    final userLocal = await storage.getUser();
    if (userLocal != null) return userLocal;

    final user = await api.getUser(id);
    storage.saveUser(user);
    return user;
  }

  Future<User?> getLocalUser() async {
    return storage.getUser();
  }

  Future<void> removeUser() async{
    storage.clear();
  }
}
