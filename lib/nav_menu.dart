import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:only_click/features/personalisation/chat/chat_list_page.dart';
import 'package:only_click/features/shop/home/home.dart';
import 'package:only_click/features/personalisation/profile/account_settings.dart';
import 'package:only_click/features/shop/store/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    Color getIconColor(int index) {
      return controller.selectedIndex.value == index
          ? (darkMode ? Colors.tealAccent : Colors.teal)
          : (darkMode ? Colors.white : Colors.black);
    }

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
          indicatorColor: darkMode
              ? Colors.tealAccent.withOpacity(0.2)
              : Colors.teal.withOpacity(0.2),
          destinations: [
            NavigationDestination(
              icon: Icon(Iconsax.home, color: getIconColor(0)),
              label: 'Home',
              selectedIcon: Icon(Iconsax.home, color: getIconColor(0)),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop_add, color: getIconColor(1)),
              label: 'Store',
              selectedIcon: Icon(Iconsax.shop_add, color: getIconColor(1)),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.message, color: getIconColor(2)),
              label: 'Chats',
              selectedIcon: Icon(Iconsax.message, color: getIconColor(2)),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user, color: getIconColor(3)),
              label: 'Profile',
              selectedIcon: Icon(Iconsax.user, color: getIconColor(3)),
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const ChatListPage(),
    const AccountPage(),
  ];
  void goToChats() {
    selectedIndex.value = 2; // Index of the ChatScreen in the screens list
  }
}
