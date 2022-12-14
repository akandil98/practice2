import 'package:flutter/material.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Screen Three',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
