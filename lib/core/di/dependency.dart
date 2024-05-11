import 'package:four_todo/app/data/repository/task_repository.dart';
import 'package:four_todo/app/data/source/local/app_database.dart';
import 'package:four_todo/app/module/repository/task_repository.dart';
import 'package:four_todo/app/module/usecase/task_get_all.dart';
import 'package:four_todo/app/presentation/home/home_notifier.dart';
import 'package:four_todo/app/presentation/main/main_notifier.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependency() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  sl.registerSingleton<TaskRepository>(TaskRepositoryImpl(sl()));

  sl.registerSingleton<TaskGetAllUseCase>(TaskGetAllUseCase(sl()));

  sl.registerFactory<MainNotifier>(() => MainNotifier());
  sl.registerFactory<HomeNotifier>(() => HomeNotifier(sl()));
}
