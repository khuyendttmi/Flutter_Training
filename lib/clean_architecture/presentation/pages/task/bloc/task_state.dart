// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_training/clean_architecture/domain/entities/task.dart';

enum TaskListStatus { inital, loading, success, failture }

// Lưu trạng thái state
class TaskListUiState extends Equatable {
  final List<Task>? task;

  const TaskListUiState({this.task});

  TaskListUiState copyWith({List<Task>? task}) {
    return TaskListUiState(task: task);
  }

  @override
  List<Object?> get props => [task];
}
