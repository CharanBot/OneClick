// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:only_click/features/authentication/sign_In/create_acc/select_user_type.dart';
import 'package:only_click/nav_menu.dart';

class Onboard_login extends StatefulWidget {
  const Onboard_login({Key? key}) : super(key: key);

  @override
  _Onboard_loginState createState() => _Onboard_loginState();
}

class _Onboard_loginState extends State<Onboard_login> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<String> imgList = [
    'assets/images/OnBoarding/onboard_1.gif',
    'assets/images/OnBoarding/onboard_2.gif',
    'assets/images/OnBoarding/onboard_3.gif',
  ];

  final List<String> textList = [
    'Connect with your local service providers',
    'Find reliable service providers near you',
    'Get the best services at your doorstep',
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.5,
              child: Column(
                children: [
                  const SizedBox(height: 84),
                  Expanded(
                    child: CarouselSlider(
                      items: imgList.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        final width = index == 2 ? 230.0 : 500.0;
                        return Image.asset(
                          item,
                          fit: BoxFit.cover,
                          width: width,
                        );
                      }).toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    textList[_current],
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDark
                                  ? Colors.white.withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)
                                  : Colors.black.withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Text(
              'Only Click',
              style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Raleway',
                  color: isDark ? Colors.white : Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 0),
                  padding: const EdgeInsets.all(80),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color.fromARGB(255, 32, 22, 88)
                        : const Color.fromARGB(255, 32, 22, 88),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const NavigationMenu());
                        },
                        child: Text(
                          'I already have an account',
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Raleway',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: isDark ? Colors.white : Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'or',
                            style: TextStyle(
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w300,
                                color: isDark ? Colors.white : Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Divider(
                              color: isDark ? Colors.white : Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Sign in using',
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                            color: isDark ? Colors.white : Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Handle the onTap event
                            },
                            child: Image.asset(
                              'assets/logos/google-icon.png',
                              width: 45,
                              height: 45,
                            ),
                          ),
                          const SizedBox(width: 40),
                          GestureDetector(
                            onTap: () {
                              // Handle the onTap event
                            },
                            child: Image.asset(
                              'assets/logos/apple_icon.png',
                              width: 40,
                              height: 34,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 24,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => SelectionPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 15.0),
                      ),
                      child: Text(
                        'Create a new account',
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 17,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
