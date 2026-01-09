import 'dart:convert';

import 'package:flutter_training/khuyendt/user_profile/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  
  static const _key = 'user';

  Future<void> saveUser(User user) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(user.toJson()));
  }

  Future<User?> getUser() async{
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if(jsonString == null) return null;
    return User.fromJson(jsonDecode(jsonString));
  }

  Future<void> clear() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_key);
  }
}