import 'package:floor/floor.dart';

@Entity(tableName: 'task', primaryKeys: ['id'])
class TaskModel {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String name;
  String? description;
  String date;
  String start;
  String end;
  bool isDone;

  TaskModel(
      {this.id,
      required this.name,
      this.description,
      required this.date,
      required this.start,
      required this.end,
      this.isDone = false});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        name: json['name'],
        date: json['date'],
        start: json['start'],
        end: json['end'],
        isDone: json['isDone']);
  }
}
