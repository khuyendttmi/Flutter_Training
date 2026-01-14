import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/clean_architecture/presentation/pages/task/bloc/task_bloc.dart';
import 'package:flutter_training/clean_architecture/presentation/pages/task/bloc/task_event.dart';
import 'package:flutter_training/clean_architecture/presentation/pages/task/bloc/task_state.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            'Clean Architecture',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TaskBloc, TaskListUiState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.task?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Title: ${state.task?[index].title}'),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn",
        onPressed:() => context.read<TaskBloc>().add(AddTask()),
        child: Icon(Icons.add),
      ),
    );
  }
}
