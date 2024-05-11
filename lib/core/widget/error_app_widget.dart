import 'package:flutter/material.dart';
import 'package:four_todo/core/helper/global_helper.dart';

class ErrorAppWidget extends StatelessWidget {
  final String description;
  final void Function() onPressButton;

  const ErrorAppWidget(
      {super.key, required this.description, required this.onPressButton});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            Image.asset('assets/images/img_error.png'),
            SizedBox(
              height: 30,
            ),
            Text(
              "Kesalahan",
              style: GlobalHelper.getTextTheme(context)
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: GlobalHelper.getTextTheme(context).bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            FilledButton.icon(
              onPressed: onPressButton,
              icon: Icon(Icons.refresh),
              label: Text("Muat ulang"),
            )
                  ],
                ),
          ),
        ));
  }
}
