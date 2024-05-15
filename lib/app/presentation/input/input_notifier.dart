import 'package:flutter/cupertino.dart';
import 'package:four_todo/app/module/entity/task.dart';
import 'package:four_todo/app/module/usecase/task_insert.dart';
import 'package:four_todo/core/provider/app_provider.dart';

class InputNotifier extends AppProvider {
  final TaskInsertUseCase _taskInsertUseCase;

  InputNotifier(this._taskInsertUseCase) {
    init();
  }

  TextEditingController _titleController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _startController = TextEditingController();
  TextEditingController _endController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  TextEditingController get titleController => _titleController;

  TextEditingController get dateController => _dateController;

  TextEditingController get startController => _startController;

  TextEditingController get endController => _endController;

  TextEditingController get descriptionController => _descriptionController;

  @override
  void init() {
    // TODO: implement init
  }

  save() async {
    await _taskInsertUseCase(
        param: TaskEntity(
            name: _titleController.text,
            date: _dateController.text,
            start: _startController.text,
            end: _endController.text,
            description: _descriptionController.text));
  }
}
