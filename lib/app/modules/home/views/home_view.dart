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
              selectedIcon: Icon(Icons.book),
              icon: Icon(Icons.book_outlined),
              label: 'Library',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.store_mall_directory),
              icon: Icon(Icons.store_mall_directory_outlined),
              label: 'Store',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.star),
              icon: Icon(Icons.star_outline),
              label: 'Wishlist',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.settings),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.notifications),
              icon: Icon(Icons.notifications_outlined),
              label: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }
}
