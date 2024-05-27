import 'package:flutter/material.dart';
import 'package:one_click/features/authentication/select_language/widgets/next_button.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _selectedLanguage = 'English'; // Default selected language

    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool isDark = brightnessValue == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: Image.asset(
              'assets/logos/one_click_no_bg_logo.png',
              width: 200,
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.grey[750]
                    : Colors.white, // Dark or Light background color
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select language for you',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black, // Text color
                      fontSize: 18.0, // Adjust text size as needed
                      fontWeight:
                          FontWeight.bold, // Adjust text weight as needed
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  DropdownButtonFormField<String>(
                    value: _selectedLanguage,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: isDark
                          ? Colors.grey[800]
                          : Colors.grey[
                              200], // Dark or Light background color for dropdown
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    dropdownColor: isDark
                        ? Colors.grey[800]
                        : Colors.grey[
                            200], // Dark or Light Dropdown background color
                    style: TextStyle(
                      color: isDark
                          ? Colors.white
                          : Colors.black, // Text color for dropdown
                    ),
                    items:
                        ['English', 'Hindi', 'Telugu'].map((String language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      if (value != null) {
                        // setState(() {
                        //   _selectedLanguage = value;
                        // });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(bottom: 56.0, right: 24.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: BotButton(),
        ),
      ),
    );
  }
}
