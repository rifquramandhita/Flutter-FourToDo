import 'package:four_todo/app/data/model/task_model.dart';
import 'package:four_todo/app/data/source/local/app_database.dart';
import 'package:four_todo/app/module/entity/task.dart';
import 'package:four_todo/app/module/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final AppDatabase _appDatabase;

  TaskRepositoryImpl(this._appDatabase);

  @override
  Stream<List<TaskEntity>> getAll() {
    final streamOfTaskModels = _appDatabase.taskDao.getAll();

    final streamOfHistoryEntities = streamOfTaskModels.map(
        (listOfHistoryModels) =>
            listOfHistoryModels
                ?.map((item) => TaskEntity(
                    id: item.id,
                    name: item.name,
                    description: item.description,
                    date: item.date,
                    start: item.start,
                    end: item.end,
                    isDone: item.isDone))
                .toList() ??
            []);

    return streamOfHistoryEntities;
  }

  @override
  Future<void> insert(TaskEntity param) async {
    final dataInsert = TaskModel.fromJson(param.toJson());
    return _appDatabase.taskDao.Insert(dataInsert);
  }

  @override
  Stream<List<TaskEntity>> getByDate(String date) {
    final streamOfTaskModels = _appDatabase.taskDao.getByDate(date);

  final streamOfHistoryEntities = streamOfTaskModels.map(
          (listOfHistoryModels) =>
      listOfHistoryModels
          ?.map((item) => TaskEntity(
          id: item.id,
          name: item.name,
          description: item.description,
          date: item.date,
          start: item.start,
          end: item.end,
          isDone: item.isDone))
          .toList() ??
          []);

  return streamOfHistoryEntities;
  }
}
