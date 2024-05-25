import 'package:floor/floor.dart';
import 'package:four_todo/app/data/model/task_model.dart';

@dao
abstract class TaskDao{
  @Query("SELECT * FROM task")
  Stream<List<TaskModel>?> getAll();

  @Query("SELECT * FROM task WHERE date =:date")
  Stream<List<TaskModel>?> getByDate(String date);

  @insert
  Future<void> Insert(TaskModel taskModel);
}