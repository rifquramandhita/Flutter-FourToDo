import 'package:flutter/material.dart';
import 'package:four_todo/app/presentation/main/main_notifier.dart';
import 'package:four_todo/core/di/dependency.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {

  MainScreen({super.key});

  late MainNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainNotifier>(
      create: (context) => sl(),
      builder: (context, child) => _build(context),
    );
  }

  _build(BuildContext context) {
    notifier = Provider.of<MainNotifier>(context);

    return Scaffold(
      body: notifier.destinationNavBarSelected,
      bottomNavigationBar: _navBarBuild(),
    );
  }

  _navBarBuild() {
    return NavigationBar(
      destinations: notifier.listMenubar,
      selectedIndex: notifier.selectedIndexNavBar,
      onDestinationSelected: (value) => _onPressMenuNavBar(value),
    );
  }

  _onPressMenuNavBar(int index) {
    notifier.selectedIndexNarBar = index;
  }
}
