import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_training/clean_architecture/data/model/base_data.dart';

part 'task_data.g.dart';

@JsonSerializable()
class TaskData extends BaseData {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'completed')
  final bool completed;

  TaskData({required this.id, required this.title, required this.completed});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'title': title, 'completed': completed};
  }

  factory TaskData.fromJson(Map<String, dynamic> json) =>
      _$TaskDataFromJson(json);

  Map<String, dynamic> toJson() => _$TaskDataToJson(this);
}
