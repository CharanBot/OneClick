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
      'image': 'assets/images/OnBoarding/board_1.gif',
      'description': 'Please select an option to proceed.',
    },
    'Individual': {
      'image': 'assets/images/OnBoarding/board_3.gif',
      'description':
          'You have selected Individual. This option is for personal use. It provides access to features tailored for individuals.',
    },
    'Service Provider': {
      'image': 'assets/images/OnBoarding/board_2.gif',
      'description':
          'You have selected Service Provider. This option is for FreeLancers looking for job oppurtunities.',
    },
  };

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color textColor = isDarkMode ? Colors.white : Colors.black;
    Color nonSelectedButtonColor = isDarkMode ? Colors.grey : Colors.grey[300]!;
    Color buttonColor = isDarkMode ? Colors.blue : Colors.black;

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
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 30), // space above descrip
                    Text(
                      optionDetails[displayOption]!['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 103),
                  ],
                ),
                SizedBox(
                  width: 300,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 'Individual';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButton == 'Individual'
                          ? Colors.orange
                          : nonSelectedButtonColor,
                      foregroundColor: textColor,
                    ),
                    child: const Text('Individual'),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedButton = 'Service Provider';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedButton == 'Service Provider'
                          ? Colors.orange
                          : nonSelectedButtonColor,
                      foregroundColor: textColor,
                    ),
                    child: const Text('Service Provider'),
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
                  Get.to(IndividualPage());
                } else if (selectedButton == 'Service Provider') {
                  Get.to(ServiceProviderPage());
                }
              },
              backgroundColor: buttonColor,
              foregroundColor: Colors.white,
              child: const Icon(Icons.arrow_circle_right),
            ),
          ),
        ],
      ),
    );
  }
}
