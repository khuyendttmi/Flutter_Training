// Khai báo một biến số nguyên mặc định là 0
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final counterProvider = StateProvider<int>((ref) => 0);

// trả về 1 giá trị duy nhất
final todoFutureProvider = FutureProvider<int?>((ref) async {
  for (var i = 0; i < 10; ) {
    Future.delayed(Duration(minutes: 1));
    return i;
  }
  return null;
});

// quản lí dữ liệu liên tục
final todoStreamProvider = StreamProvider<int>((ref)async*{
  for (var i = 0; i < 10; i++) {
    Future.delayed(Duration(minutes: 1));
    yield i;
  }
});
