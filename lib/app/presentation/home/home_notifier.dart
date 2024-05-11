import 'dart:async';

import 'package:four_todo/app/module/entity/task.dart';
import 'package:four_todo/app/module/usecase/task_get_all.dart';
import 'package:four_todo/core/provider/app_provider.dart';

class HomeNotifier extends AppProvider {
  final TaskGetAllUseCase _taskGetAllUseCase;

  HomeNotifier(this._taskGetAllUseCase) {
    init();
  }

  late StreamSubscription<List<TaskEntity>> _streamListTask;
  List<TaskEntity> _listTask = [];

  List<TaskEntity> get listTask => _listTask;

  List<TaskEntity> get listTaskDone {
    final listFiltered = _listTask.where((element) => element.isDone).toList();
    return listFiltered;
  }

  double get progressToday =>
      (_listTask.isEmpty) ? 0 : (listTaskDone.length / listTask.length * 100);

  @override
  void init() {
    _openStreamTask();
  }

  _openStreamTask() {
    _streamListTask = _taskGetAllUseCase().listen((value) {
      if (!isDispose) {
        _listTask = value;
        notifyListeners();
      } else {
        stopStreamHistory();
      }
    });
  }

  stopStreamHistory() {
    _streamListTask.cancel();
  }
}
