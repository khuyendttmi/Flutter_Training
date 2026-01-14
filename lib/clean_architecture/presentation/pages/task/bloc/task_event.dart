import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class TaskLoaded extends TaskEvent {
  const TaskLoaded();
}

class AddTask extends TaskEvent {
  const AddTask();
}
