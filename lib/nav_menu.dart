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

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode
              ? Colors.grey.withOpacity(0)
              : Colors.white.withOpacity(1),
          indicatorColor: darkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop_add), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.message), label: 'Chats'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
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
