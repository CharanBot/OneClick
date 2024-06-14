import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_click/features/shop/home/widgets/big_Square.dart';
import 'package:only_click/features/shop/home/widgets/categories.dart';
import 'package:only_click/features/shop/home/widgets/mostbooked.dart';
import 'package:only_click/features/shop/home/widgets/searchbar.dart';
import 'package:only_click/features/shop/home/widgets/promo_slider.dart';
import 'package:only_click/nav_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    // Dummy user data
    const String userName = "Naga Charan";
    const String userPhoneNumber = "+91-7207262274";

    // Get the NavigationController instance
    final NavigationController navController = Get.find();

    // Dummy banner images
    final List<String> banners = [
      "assets/images/banners/sample_banner1.jpg",
      "assets/images/banners/sample_banner2.jpg",
      "assets/images/banners/sample_banner3.jpg",
    ];

    return Scaffold(
      backgroundColor: darkMode ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                        height: 14), // Space above the welcome message
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                'Welcome, $userName',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: darkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(
                                height:
                                    4), // Space between name and phone number
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                userPhoneNumber,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: darkMode ? Colors.white : Colors.black,
                                ),
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
                            14), // Space between the welcome message and the search box
                    SearchContainer(darkMode: darkMode),
                    const SizedBox(
                        height: 14), // Space between search box and slider
                    PromoSlider(banners: banners),
                    const SizedBox(
                        height: 14), // Space between slider and categories
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Explore by services',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: darkMode ? Colors.white : Colors.black,
                          fontFamily: 'Montserrat', // Custom font family
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 8), // Add some space below the heading
                    const THomeCategories(),
                    const SizedBox(
                        height:
                            14), // Space between categories and square widget
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: BigRoundEdgedSquare(
                        imagePath:
                            "assets/images/banners/construction_square.jpg",
                      ),
                    ),
                    const SizedBox(height: 25), // Space below the square widget
                    SizedBox(
                      height: 5.0, // Height of the divider
                      child: Container(
                        color: darkMode
                            ? Colors.grey.withOpacity(0.35)
                            : Colors.grey.withOpacity(0.3),
                      ),
                    ),
                    const SizedBox(height: 14), // Space below the divider
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                      child: Text(
                        'Most booked services',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Raleway',
                          color: darkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14), // Space below subheading
                    const Mostbookedcategories(),
                    const SizedBox(
                        height: 14), //space below Mostbookedcategories
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
