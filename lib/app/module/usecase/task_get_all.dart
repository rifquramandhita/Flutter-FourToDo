import 'package:four_todo/app/module/entity/task.dart';
import 'package:four_todo/app/module/repository/task_repository.dart';
import 'package:four_todo/core/usecase/app_use_case.dart';

class TaskGetAllUseCase extends AppUseCase<Stream<List<TaskEntity>>, void> {
  final TaskRepository _taskRepository;

  TaskGetAllUseCase(this._taskRepository);

  @override
  Stream<List<TaskEntity>> call({void param}) {
    return _taskRepository.getAll();
  }
}
