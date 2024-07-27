import 'dart:developer';

import 'package:flutter/material.dart';

class AppTheme {
  final BuildContext context;

  AppTheme(this.context);

  get appBarBackgroundColor => Theme.of(context).colorScheme.inversePrimary;

  int getCrossAxisCount() {
    final screenWidth = MediaQuery.sizeOf(context).width;

    log('width= ${screenWidth}');

    if (screenWidth < 600) {
      return 2;
    } else if (screenWidth < 840) {
      return 4;
    } else {
      return 6;
    }
  }
}
