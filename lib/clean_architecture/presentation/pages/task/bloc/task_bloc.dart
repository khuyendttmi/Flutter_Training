import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/clean_architecture/domain/usercase/get_task_usercase.dart';
import 'package:flutter_training/clean_architecture/presentation/pages/task/bloc/task_event.dart';
import 'package:flutter_training/clean_architecture/presentation/pages/task/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskListUiState> {
  final GetTaskUsercase _getTaskUsercase;

  TaskBloc(this._getTaskUsercase) : super(const TaskListUiState()) {
    on<TaskLoaded>(_onLoaded);
    on<AddTask>((event, emit) {});
  }

  FutureOr<void> _onLoaded(TaskLoaded event, Emitter<TaskListUiState> emit) async{
    final result = await _getTaskUsercase.call();

    final tasks = result.take(10).toList();

    emit(state.copyWith(task: tasks));
  }
}
