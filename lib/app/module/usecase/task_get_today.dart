import 'package:four_todo/app/module/entity/task.dart';
import 'package:four_todo/app/module/repository/task_repository.dart';
import 'package:four_todo/core/helper/date_time_helper.dart';
import 'package:four_todo/core/usecase/app_use_case.dart';

class TaskGetTodayUseCase extends AppUseCase<Stream<List<TaskEntity>>, void> {
  final TaskRepository _taskRepository;

  TaskGetTodayUseCase(this._taskRepository);

  @override
  Stream<List<TaskEntity>> call({void param}) {
    final date = DateTimeHelper.reformatDateTime(dateTime: DateTime.now());
    return _taskRepository.getByDate(date);
  }
}
