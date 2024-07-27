import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_theme.dart';
import '../controllers/read_controller.dart';

class ReadView extends GetView<ReadController> {
  const ReadView({super.key});
  @override
  Widget build(BuildContext context) {
    String title = Get.parameters['title'] ?? '';
    String? asset = Get.parameters['asset'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
        backgroundColor: AppTheme(context).appBarBackgroundColor,
      ),
      body: const Center(
        child: Text(
          'ReadView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
