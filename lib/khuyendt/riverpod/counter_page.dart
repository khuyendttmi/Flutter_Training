// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/khuyendt/riverpod/river_provider.dart';
import 'package:go_router/go_router.dart';

class MyCounterPage extends ConsumerWidget {
  const MyCounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Dùng watch để theo dõi số counter, nếu số thay đổi thì Text tự cập nhật
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page', style: TextStyle(fontWeight: FontWeight.w600)),
        actions: [
          IconButton(onPressed: () {
            context.push('/todo');
          }, icon: Icon(Icons.document_scanner)),
        ],
      ),
      body: Center(child: Text('Số hiện tại: $count', style: TextStyle(fontSize: 18),)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 2. Dùng read để thay đổi giá trị khi bấm nút
          ref.read(counterProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
