import 'package:four_todo/app/module/entity/task.dart';
import 'package:four_todo/app/module/repository/task_repository.dart';
import 'package:four_todo/core/usecase/app_use_case.dart';

class TaskInsertUseCase extends AppUseCase<Future<void>, TaskEntity>{
  final TaskRepository _taskRepository;

  TaskInsertUseCase(this._taskRepository);
  @override
  Future<void> call({TaskEntity? param}) {
    return _taskRepository.insert(param!);
  }

}