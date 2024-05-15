import 'package:floor/floor.dart';
import 'package:four_todo/app/data/model/task_model.dart';

@dao
abstract class TaskDao{
  @Query("SELECT * FROM task")
  Stream<List<TaskModel>?> getAll();

  @insert
  Future<void> Insert(TaskModel taskModel);
}