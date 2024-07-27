import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_theme.dart';

class NotificationBodyView extends GetView {
  const NotificationBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: false,
        backgroundColor: AppTheme(context).appBarBackgroundColor,
      ),
      body: const Center(
        child: Text(
          'NotificationBodyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
