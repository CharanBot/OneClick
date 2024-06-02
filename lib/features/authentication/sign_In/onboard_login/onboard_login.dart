// ignore_for_file: library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:one_click/features/authentication/sign_In/create_acc/select_user_type.dart';
import 'package:one_click/nav_menu.dart';

class Onboard_login extends StatefulWidget {
  const Onboard_login({Key? key}) : super(key: key);

  @override
  _Onboard_loginState createState() => _Onboard_loginState();
}

class _Onboard_loginState extends State<Onboard_login> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<String> imgList = [
    'assets/images/OnBoarding/board_1.gif',
    'assets/images/OnBoarding/board_2.gif',
    'assets/images/OnBoarding/board_3.gif',
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
                  const SizedBox(height: 24),
                  Expanded(
                    child: CarouselSlider(
                      items: imgList
                          .map((item) => Image.asset(
                                item,
                                fit: BoxFit.cover,
                                width: 1000,
                              ))
                          .toList(),
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
                    style:
                        TextStyle(color: isDark ? Colors.white : Colors.black),
                    textAlign: TextAlign.center,
                  ),
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
            const SizedBox(height: 20),
            Text(
              'Only Click',
              style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
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
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const NavigationMenu());
                        },
                        child: Text(
                          'I already have an account',
                          style: TextStyle(
                              color: isDark ? Colors.white : Colors.white),
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
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const SizedBox(width: 40),
                          GestureDetector(
                            onTap: () {
                              // Handle the onTap event
                            },
                            child: Image.asset(
                              'assets/logos/facebook-icon.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          const SizedBox(width: 40),
                          GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/logos/google-icon.png',
                              width: 40,
                              height: 40,
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
                        Get.to(SelectionPage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 15.0),
                      ),
                      child: Text(
                        'Create a new account',
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 16),
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
