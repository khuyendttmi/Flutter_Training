import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/clean_architecture/domain/usercase/get_task_usercase.dart';
import 'package:flutter_training/clean_architecture/presentation/pages/task/bloc/task_bloc.dart';
import 'package:flutter_training/clean_architecture/presentation/pages/task/bloc/task_event.dart';
import 'package:flutter_training/clean_architecture/presentation/pages/task/pages/task_screen.dart';
import 'package:flutter_training/khuyendt/user_profile_retrofit/get_it/service_locator.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<TaskBloc>();
        bloc.add(const TaskLoaded());
        return  bloc;
      },
      child: TaskScreen(),
    );
  }
}
