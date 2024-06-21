import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_click/features/authentication/sign_In/create_acc/individual_create_acc.dart';
import 'package:only_click/features/authentication/sign_In/create_acc/service_provider_create_acc.dart';

class SelectionPage extends StatefulWidget {
  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  String selectedButton = '';

  final Map<String, Map<String, String>> optionDetails = {
    'Default': {
      'image': 'assets/images/OnBoarding/onboard_3.gif',
      'description': 'Please select an option to proceed.',
    },
    'Individual': {
      'image': 'assets/images/OnBoarding/service_provider.gif',
      'description': 'I need people to fix my problems.',
    },
    'Service Provider': {
      'image': 'assets/images/OnBoarding/individual.gif',
      'description': 'I am looking for job opportunities.',
    },
  };

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color nonSelectedButtonColor =
        isDarkMode ? Colors.transparent : Colors.white;

    // Determine which details to show
    String displayOption =
        selectedButton.isNotEmpty ? selectedButton : 'Default';

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Stack(
        children: [
          // Changed alignment from Center to start (top)
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100), //space above the GIFs
                Column(
                  children: [
                    Image.asset(
                      optionDetails[displayOption]!['image']!,
                      width: 300,
                      height: 200,
                    ),
                    const SizedBox(height: 30), // space above descrip
                    Text(
                      optionDetails[displayOption]!['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 103),
                  ],
                ),
                SizedBox(
                  width: 240,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 'Individual';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButton == 'Individual'
                          ? Colors.teal
                          : nonSelectedButtonColor,
                      foregroundColor: textColor,
                      side: selectedButton == 'Individual'
                          ? BorderSide.none
                          : const BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                    ),
                    child: const Text(
                      'Individual',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 240,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 'Service Provider';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButton == 'Service Provider'
                          ? Colors.teal
                          : nonSelectedButtonColor,
                      foregroundColor: textColor,
                      side: selectedButton == 'Service Provider'
                          ? BorderSide.none
                          : const BorderSide(
                              color: Colors.grey,
                              width: 2.0,
                            ),
                    ),
                    child: const Text(
                      'Service Provider',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 56,
            right: 24,
            child: FloatingActionButton(
              onPressed: () {
                if (selectedButton == 'Individual') {
                  Get.to(() => IndividualPage());
                } else if (selectedButton == 'Service Provider') {
                  Get.to(() => ServiceProviderPage());
                }
              },
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              child: const Icon(Icons.arrow_circle_right),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SelectionPage(),
    theme: ThemeData(
      primarySwatch: Colors.teal,
      fontFamily: 'Poppins',
    ),
  ));
}
