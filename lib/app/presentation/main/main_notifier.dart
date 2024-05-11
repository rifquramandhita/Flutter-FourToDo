import 'package:flutter/material.dart';
import 'package:four_todo/app/presentation/home/home_screen.dart';
import 'package:four_todo/core/provider/app_provider.dart';
import 'package:four_todo/core/widget/loading_app_widget.dart';

class MainNotifier extends AppProvider {
  List<Widget> _listDestinationNavBar = [
    HomeScreen(),
    LoadingAppWidget(),
    LoadingAppWidget()
  ];
  List<Widget> _listMenuNavBar = [
    NavigationDestination(
        icon: Icon(Icons.home_outlined),
        label: "Home",
        selectedIcon: Icon(Icons.home)),
    NavigationDestination(
      icon: Icon(Icons.task_outlined),
      label: "My Task",
      selectedIcon: Icon(Icons.task),
    ),
    NavigationDestination(
      icon: Icon(Icons.calendar_month_outlined),
      label: "Calendar",
      selectedIcon: Icon(Icons.calendar_month),
    )
  ];
  int _selectedIndexNavBar = 0;

  int get selectedIndexNavBar => _selectedIndexNavBar;

  Widget get destinationNavBarSelected =>
      _listDestinationNavBar[_selectedIndexNavBar];

  List<Widget> get listMenubar => _listMenuNavBar;

  set selectedIndexNarBar(int param) {
    _selectedIndexNavBar = param;
    notifyListeners();
  }

  @override
  void init() {
    // TODO: implement init
  }
}
