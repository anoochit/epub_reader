import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_theme.dart';

class WishlistBodyView extends GetView {
  const WishlistBodyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        centerTitle: false,
        backgroundColor: AppTheme(context).appBarBackgroundColor,
      ),
      body: const Center(
        child: Text(
          'WishlistBodyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
