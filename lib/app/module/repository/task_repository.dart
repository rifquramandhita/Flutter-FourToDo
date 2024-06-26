import 'package:four_todo/app/data/model/task_model.dart';
import 'package:four_todo/app/module/entity/task.dart';

abstract class TaskRepository{
  Stream<List<TaskEntity>> getAll();
  Stream<List<TaskEntity>> getByDate(String date);
  Future<void> insert(TaskEntity param);
}