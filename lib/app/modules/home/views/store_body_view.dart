import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_theme.dart';

class StoreBodyView extends GetView {
  const StoreBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        centerTitle: false,
        backgroundColor: AppTheme(context).appBarBackgroundColor,
      ),
      body: const Center(
        child: Text(
          'StoreBodyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
