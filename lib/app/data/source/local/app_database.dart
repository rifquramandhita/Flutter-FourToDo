import 'package:floor/floor.dart';
import 'package:four_todo/app/data/model/task_model.dart';
import 'package:four_todo/app/data/source/local/dao/task_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [TaskModel])
abstract class AppDatabase extends FloorDatabase{
  TaskDao get taskDao;
}