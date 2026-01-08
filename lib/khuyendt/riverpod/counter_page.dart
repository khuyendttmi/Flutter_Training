// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/khuyendt/riverpod/river_provider.dart';
import 'package:go_router/go_router.dart';

class MyCounterPage extends ConsumerWidget {
  const MyCounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Dùng watch để theo dõi counter rebuild UI
    final count = ref.watch(counterProvider);
    final todos = ref.watch(todoFutureProvider);
    final todoStream = ref.watch(todoStreamProvider);

    ref.listen(counterProvider, (previous, next) {
      if (next == 5) {
        print('Tôi đã click đến 5');// gọi snackbar, log,..
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter Page',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push('/todo');
            },
            icon: Icon(Icons.document_scanner),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'counterProvider: $count',
              style: TextStyle(fontSize: 18),
            ),
          ),
          todos.when(
            data: (data) {
              return Text(
                'FutureProvider: $data',
                style: TextStyle(fontSize: 18),
              );
            },
            error: (error, stackTrace) {
              return Text(error.toString());
            },
            loading: () {
              return Text('loading');
            },
          ),
          todoStream.when(
            data: (data) =>
                Text('StreamProvider: $data', style: TextStyle(fontSize: 18)),
            error: (error, stackTrace) => Text(stackTrace.toString()),
            loading: () => Text('loading'),
          ),
        ],
      ),
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
