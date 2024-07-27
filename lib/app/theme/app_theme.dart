import 'package:flutter/material.dart';

class AppTheme {
  final BuildContext context;

  AppTheme(this.context);

  get appBarBackgroundColor => Theme.of(context).colorScheme.inversePrimary;
}
