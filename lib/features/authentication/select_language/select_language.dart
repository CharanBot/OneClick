import 'package:flutter/material.dart';
import 'package:one_click/features/authentication/select_language/widgets/next_button.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  String _selectedLanguage = 'English'; // Default selected language
  String _gifPath = 'assets/logos/only_click_logo.png'; // Default GIF path
  String _message =
      'You have selected English, you can also change this later'; // Default message

  final Map<String, String> _languageGifs = {
    'English': 'assets/logos/only_click_logo.png',
    'Hindi': 'assets/logos/only_click_logo.png',
    'Telugu': 'assets/logos/only_click_logo.png',
  };

  final Map<String, String> _languageMessages = {
    'English': 'You have selected English,\nyou can also change this later',
    'Hindi': 'आपने हिंदी का चयन किया है,\nआप इसे बाद में बदल भी सकते हैं',
    'Telugu': 'మీరు తెలుగును ఎంచుకున్నారు,\nమీరు దీన్ని తర్వాత కూడా మార్చవచ్చు',
  };

  final Map<String, String> _languageNames = {
    'English': 'English',
    'Hindi': 'हिंदी',
    'Telugu': 'తెలుగు',
  };

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool isDark = brightnessValue == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height *
                0.1, // Adjust the value to move up
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  _gifPath,
                  width: 400,
                  alignment: Alignment.center,
                ),
                const SizedBox(
                    height: 60.0), // space between the GIF and the dropdown
                Container(
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
                          color: isDark
                              ? Colors.white
                              : Colors.black, // Text color
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
                        items: ['English', 'Hindi', 'Telugu']
                            .map((String language) {
                          return DropdownMenuItem<String>(
                            value: language,
                            child: Text(_languageNames[language]!),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          if (value != null) {
                            setState(() {
                              _selectedLanguage = value;
                              _gifPath = _languageGifs[value]!;
                              _message = _languageMessages[value]!;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom:
                180, // Adjust the value to position the text above the button
            left: 24,
            right: 24,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.grey[750]
                      : Colors.white, // Dark or Light background color
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
                    width: 1.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? Colors.black45
                          : Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  _message,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black, // Text color
                    fontSize: 16.0, // Adjust text size as needed
                    fontWeight: FontWeight.w500, // Text weight
                  ),
                  textAlign: TextAlign.center,
                ),
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
