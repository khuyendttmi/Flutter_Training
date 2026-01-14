// 1. Tạo một class chứa toàn bộ controller của form
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationControllers {
  final name = TextEditingController();
  final phone = TextEditingController();

  void dispose() {
    name.dispose();
    phone.dispose();
  }
}

// dùng 1 Provider duy nhất cho tất cả text
final registrationProvider = Provider.autoDispose((ref) {
  final controllers = RegistrationControllers();
  ref.onDispose(() => controllers.dispose());
  return controllers;
});