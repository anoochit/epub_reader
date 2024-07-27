import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'export.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.navIndex.value,
          children: const [
            LibraryBodyView(),
            StoreBodyView(),
            WishlistBodyView(),
            SettingsBodyView(),
            NotificationBodyView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.navIndex.value,
          onDestinationSelected: (value) => controller.navIndex.value = value,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.book),
              label: 'Library',
            ),
            NavigationDestination(
              icon: Icon(Icons.store_mall_directory),
              label: 'Store',
            ),
            NavigationDestination(
              icon: Icon(Icons.star),
              label: 'Wishlist',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }
}
