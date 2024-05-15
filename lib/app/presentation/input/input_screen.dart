import 'package:flutter/material.dart';
import 'package:four_todo/app/presentation/input/input_notifier.dart';
import 'package:four_todo/core/helper/date_time_helper.dart';
import 'package:four_todo/core/screen/app_screen.dart';

class InputScreen extends AppScreen<InputNotifier> {
  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text("Add Task"),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: notifier.titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    onTap: () => _onPressDate(context),
                    controller: notifier.dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onTap: () => _onPressStart(context),
                          controller: notifier.startController,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: 'Start',
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                          child: TextField(
                        onTap: () => _onPressEnd(context),
                        controller: notifier.endController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'End',
                          border: const OutlineInputBorder(),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: notifier.descriptionController,
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            )),
            SizedBox(
              height: 30,
            ),
            Container(
                width: double.maxFinite,
                child: FilledButton(
                    onPressed: () => _onPressSave(context),
                    child: Text("Simpan")))
          ],
        ),
      ),
    );
  }

  @override
  checkVariable() {
    return null;
  }

  @override
  Widget? floatingActionButtonBuild(BuildContext context) {
    return null;
  }

  _onPressDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (date != null)
      notifier.dateController.text =
          DateTimeHelper.reformatDateTime(dateTime: date);
  }

  _onPressStart(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    );
    if (time != null)
      notifier.startController.text = '${time.hour} : ${time.minute}';
  }

  _onPressEnd(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    );
    if (time != null)
      notifier.endController.text = '${time.hour} : ${time.minute}';
  }

  _onPressSave(BuildContext context) {
    notifier.save();
    Navigator.pop(context);
  }
}
