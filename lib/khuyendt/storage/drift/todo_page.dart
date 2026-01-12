import 'package:flutter/material.dart';
import 'package:flutter_training/khuyendt/storage/drift/database/app_database.dart';

class TodoPageDrift extends StatelessWidget {
  final db = AppDatabase();

  TodoPageDrift({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    void showEditSheet({Todo? todo}) {
      controller.text = todo?.title ?? '';

      showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(hintText: 'Công việc...'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed:
                        () => {
                          if (todo == null)
                            {db.addTodo(controller.text)}
                          else
                            {db.updateTodo(todo.copyWith(title:controller.text))},
                          controller.text = '',
                          Navigator.pop(context),
                        },
                    child: Text('Lưu'),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Drift Demo')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showEditSheet(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Todo>>(
        stream: db.watchTodos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          final todos = snapshot.data!;
          return ListView(
            children:
                todos
                    .map(
                      (e) => ListTile(
                        title: Text(
                          e.title,
                          style: TextStyle(
                            decoration:
                                e.isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        leading: Checkbox(
                          value: e.isDone,
                          onChanged: (value) {
                            db.updateTodo(e.copyWith(isDone: value));
                          },
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => showEditSheet(todo: e),
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () => db.deleteTodo(e.id),
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
          );
        },
      ),
    );
  }
}
