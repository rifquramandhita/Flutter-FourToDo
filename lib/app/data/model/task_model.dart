import 'package:floor/floor.dart';

@Entity(tableName: 'task', primaryKeys: ['id'])
class TaskModel {
  @PrimaryKey(autoGenerate: true)
  int id;
  String name;
  String? description;
  String date;
  String start;
  String end;
  bool isDone;

  TaskModel({
    required this.id,
    required this.name,
    this.description,
    required this.date,
    required this.start,
    required this.end,
    this.isDone = false
  });
}
