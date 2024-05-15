import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.g.dart';
part 'task.freezed.dart';

@freezed
sealed class Task with _$Task{
  factory Task.entity({
    int? id,
    required String name,
    String? description,
    required String  date,
    required String start,
    required String end,
    @Default(false) bool isDone
  }) = TaskEntity;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
}
