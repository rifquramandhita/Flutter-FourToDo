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
}
