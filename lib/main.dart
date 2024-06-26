import 'package:flutter/material.dart';
import 'package:four_todo/app/presentation/main/main_screen.dart';
import 'package:four_todo/config/app_theme.dart';
import 'package:four_todo/core/di/dependency.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id', null);
  await initDependency();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(),
      home: MainScreen(),
    );
  }
}

