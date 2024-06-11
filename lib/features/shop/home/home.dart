import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click/features/shop/home/widgets/categories.dart';
import 'package:one_click/features/shop/home/widgets/searchbar.dart';
import 'package:one_click/features/shop/home/widgets/promo_slider.dart';
import 'package:one_click/nav_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    // Dummy user data
    const String userName = "Naga Charan";
    const String userPhoneNumber = "+91 7207262274";

    // Get the NavigationController instance
    final NavigationController navController = Get.find();

    // Dummy banner images
    final List<String> banners = [
      'https://via.placeholder.com/400x200',
      'https://via.placeholder.com/400x200',
      'https://via.placeholder.com/400x200',
    ];

    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 14), //space above the welcome message
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome, $userName',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: darkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(
                              height: 4), // Space between name and phone number
                          Text(
                            userPhoneNumber,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: darkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        color: darkMode ? Colors.white : Colors.black,
                        onPressed: () {
                          // Use the goToChats method to navigate to the ChatScreen
                          navController.goToChats();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                      height:
                          14), //space between the welcome message and the search box
                  SearchContainer(darkMode: darkMode),
                  const SizedBox(
                      height: 14), // space between search box and slider
                  PromoSlider(banners: banners),
                  const SizedBox(
                      height: 14), // space between slider and categories
                  const THomeCategories(), // Add the categories widget here
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
