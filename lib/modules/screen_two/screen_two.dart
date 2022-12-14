import 'package:flutter/material.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Screen Two',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
