import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_theme.dart';

class SettingsBodyView extends GetView {
  const SettingsBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: false,
        backgroundColor: AppTheme(context).appBarBackgroundColor,
      ),
      body: const Center(
        child: Text(
          'SettingsBodyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
