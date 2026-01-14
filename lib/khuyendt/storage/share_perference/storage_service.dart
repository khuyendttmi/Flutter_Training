import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // lưu dữ liệu theo key-value (token, id, username)
  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', 'anto');
  }

  Future<String> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? 'Chưa có dữ liệu';
  }
}