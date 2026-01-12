import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_training/khuyendt/storage/share_perference/storage_service.dart';

class SpNotifier extends StateNotifier<String> {
  SpNotifier() : super('');

  final service = StorageService();

  void add() {
    service.saveData();
  }

  void loadData() async{
    final username = await service.loadData();
    state = username;
  }
}

final spProvider = StateNotifierProvider<SpNotifier, String>(
  (ref) => SpNotifier(),
);
