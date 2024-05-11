import 'package:flutter/material.dart';
import 'package:four_todo/core/di/dependency.dart';
import 'package:four_todo/core/provider/app_provider.dart';
import 'package:four_todo/core/widget/error_app_widget.dart';
import 'package:four_todo/core/widget/loading_app_widget.dart';
import 'package:provider/provider.dart';

abstract class AppScreen<T extends AppProvider> extends StatelessWidget {
  AppScreen({Key? key}) : super(key: key);

  late T notifier;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => sl(),
      builder: (context, child) {
        return _build(context);
      },
    );
  }

  Widget _build(BuildContext context) {
    notifier = Provider.of<T>(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkVariable();
    });

    return Scaffold(
      appBar: appBarBuild(context),
      body: (notifier.isLoading)
          ? LoadingAppWidget()
          : (notifier.errorMessage.isNotEmpty)
              ? ErrorAppWidget(
                  description: notifier.errorMessage,
                  onPressButton: () {
                    notifier.errorMessage = '';
                    notifier.init();
                  })
              : bodyBuild(context),
      floatingActionButton: floatingActionButtonBuild(context),
    );
  }

  checkVariable();

  AppBar? appBarBuild(BuildContext context);

  Widget bodyBuild(BuildContext context);

  Widget? floatingActionButtonBuild(BuildContext context);
}
