import 'package:flutter/material.dart';

class CardOutlinedAppWidget extends StatelessWidget {
  final Widget child;
  CardOutlinedAppWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Container(
        child: child,
      ),
    );
  }
}
