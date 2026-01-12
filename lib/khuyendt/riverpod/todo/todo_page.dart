import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/khuyendt/riverpod/todo/todo_provider.dart';
import 'package:go_router/go_router.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final todos = ref.watch(todoProvider);
    final todoNotifier = ref.read(todoProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [IconButton(onPressed: () {
          context.push('/contact');
        }, icon: Icon(Icons.contact_page))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Nhập công việc...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      String title = controller.text;
                      todoNotifier.add(title);
                    }
                  },
                ),
              ],
            ),
          ),
          // Danh sách công việc
          Expanded(
            child:
                todos.isEmpty
                    ? Center(child: Text('Chưa có công việc nào'))
                    : ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (_, index) {
                        final todo = todos[index];

                        return ListTile(
                          leading: Checkbox(
                            value: todo.completed,
                            onChanged: (_) {
                              todoNotifier.toggleTodo(todo.id);
                            },
                          ),
                          title: Text(
                            todo.title,
                            style: TextStyle(
                              decoration:
                                  todo.completed
                                      ? TextDecoration.lineThrough
                                      : null,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              todoNotifier.removeTodo(todo.id);
                            },
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
