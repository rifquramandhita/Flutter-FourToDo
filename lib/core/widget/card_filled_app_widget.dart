import 'package:flutter/material.dart';

class CardFilledAppWidget extends StatelessWidget {
  final Widget child;
  final Color? color;

  const CardFilledAppWidget({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Container(
        child: child,
      ),
    );
  }
}
