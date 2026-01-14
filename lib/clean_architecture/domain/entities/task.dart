
class Task {
  final int id;
  final String title;
  final bool completed;

  Task({required this.id, required this.title, required this.completed});

  Task copyWith({int? id, String? title, bool? completed}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
