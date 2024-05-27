import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click/features/authentication/sign_In/login/login_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingState createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final List<dynamic> _furnitures = [
    {
      'title': 'One \nClick',
      'sub_title': 'Find all Home services',
      'image':
          'https://images.unsplash.com/photo-1612015900986-4c4d017d1648?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fGZ1cm5pdHVyZXN8ZW58MHx8MHxibGFja3w%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
    },
    {
      'title': 'One \nClick',
      'sub_title': 'Connect with your nearby service providers',
      'image':
          'https://images.unsplash.com/photo-1583847268964-b28dc8f51f92?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVybml0dXJlc3xlbnwwfDF8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
    },
    {
      'title': 'One \nClick',
      'sub_title': 'Chat with your local service providers',
      'image':
          'https://images.unsplash.com/photo-1532499012374-fdfae50e73e9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZnVybml0dXJlc3xlbnwwfDF8MHxibGFja3w%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
    },
    {
      'title': 'One \nClick',
      'sub_title': 'Connect with your nearby clients',
      'image':
          'https://images.unsplash.com/photo-1633555715049-0c2777ee516e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTl8fGZ1cm5pdHVyZXN8ZW58MHwxfDB8YmxhY2t8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
    }
  ];

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 20), vsync: this)
        ..repeat(reverse: true);

  late final Animation<double> _animation = Tween<double>(begin: 1.0, end: 1.5)
      .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool isDark = brightnessValue == Brightness.dark;
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (int index) {
          _controller.value = 0.0;
          _controller.forward();
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                child: ScaleTransition(
                  scale: _animation,
                  child: Image.network(
                    _furnitures[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.1)
                        ])),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInDown(
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                              _furnitures[index]['title'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeInDown(
                              delay: const Duration(milliseconds: 100),
                              duration: const Duration(milliseconds: 800),
                              child: Text(
                                _furnitures[index]['sub_title'],
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 18,
                                ),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          FadeInLeft(
                            delay: const Duration(milliseconds: 100),
                            duration: const Duration(milliseconds: 1000),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                onPressed: () {
                                  Get.to(() => const LoginPage());
                                },
                                color: isDark
                                    ? Colors.blue
                                    : const Color.fromARGB(255, 80, 80,
                                        80), // Adjust button color based on theme
                                padding: const EdgeInsets.only(
                                    right: 5, left: 30, top: 5, bottom: 5),
                                child: SizedBox(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Get Started',
                                        style: TextStyle(
                                          color: isDark
                                              ? Colors.white
                                              : Colors
                                                  .white, // Adjust text color based on theme
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: isDark
                                              ? Colors.blue
                                              : Colors
                                                  .white, // Adjust icon background color based on theme
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: isDark
                                              ? Colors.white
                                              : Colors
                                                  .grey, // Adjust icon color based on theme
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                        ])),
              )
            ],
          );
        },
        itemCount: _furnitures.length,
        controller: PageController(viewportFraction: 1.0),
      ),
    );
  }
}
