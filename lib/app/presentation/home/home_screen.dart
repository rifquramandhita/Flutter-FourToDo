import 'package:flutter/material.dart';
import 'package:four_todo/app/presentation/home/home_notifier.dart';
import 'package:four_todo/core/helper/global_helper.dart';
import 'package:four_todo/core/icon/app_icon_icons.dart';
import 'package:four_todo/core/screen/app_screen.dart';
import 'package:four_todo/core/widget/card_filled_app_widget.dart';
import 'package:four_todo/core/widget/card_outlined_app_widget.dart';

class HomeScreen extends AppScreen<HomeNotifier> {
  @override
  AppBar? appBarBuild(BuildContext context) {
    return AppBar(
      title: Text("Home"),
    );
  }

  @override
  Widget bodyBuild(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          _dashboardLayout(context),
          SizedBox(
            height: 20,
          ),
          _todayTaskLayout(context)
        ],
      ),
    ));
  }

  @override
  checkVariable() {}

  _dashboardLayout(BuildContext context) {
    return CardFilledAppWidget(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today's progress summary",
              style: GlobalHelper.getTextTheme(context).titleMedium,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Icon(
                  AppIcon.chart_line,
                  size: 40,
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${notifier.listTaskDone.length} Task',
                          style: GlobalHelper.getTextTheme(context).bodyLarge,
                        ),
                        Text(
                          '${notifier.progressToday} %',
                          style: GlobalHelper.getTextTheme(context).bodyMedium,
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    LinearProgressIndicator(
                      value: notifier.progressToday,
                    ),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  _todayTaskLayout(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Task",
            style: GlobalHelper.getTextTheme(context).titleLarge,
          ),
          SizedBox(
            height: 10,
          ),
          (notifier.listTask.isEmpty)
              ? Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.not_interested,
                        size: 100,
                      ),
                      Text(
                        "Data not found",
                        style: GlobalHelper.getTextTheme(context).headlineSmall,
                      )
                    ],
                  ),
                )
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: notifier.listTask.length,
                  itemBuilder: (context, index) {
                    final item = notifier.listTask[index];
                    return CardOutlinedAppWidget(
                        child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: GlobalHelper.getTextTheme(context)
                                    .titleMedium,
                              ),
                              Text("${item.start} - ${item.end}")
                            ],
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_right))
                        ],
                      ),
                    ));
                  },
                )
        ],
      ),
    );
  }

  @override
  Widget? floatingActionButtonBuild(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _onPressAddButton(context),
      child: Icon(Icons.add),
    );
  }

  _onPressAddButton(BuildContext context) {}
}
