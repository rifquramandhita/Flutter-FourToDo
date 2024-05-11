import 'package:four_todo/app/module/entity/task.dart';

abstract class TaskRepository{
  Stream<List<TaskEntity>> getAll();
}