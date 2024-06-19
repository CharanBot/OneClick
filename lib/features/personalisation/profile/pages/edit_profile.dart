// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:only_click/features/personalisation/profile/Widgets_profile/Widgets.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = '+91';

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: darkMode ? Colors.grey[850] : const Color(0xfff3f4fe),
        title: Txt(
          text: "Edit Profile",
          fontWeight: FontWeight.bold,
          color: darkMode ? Colors.white : Colors.black,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: darkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: TextStyle(
                  color: darkMode ? Colors.white70 : Colors.black87,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: darkMode ? Colors.white54 : Colors.black54,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: darkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              style: TextStyle(color: darkMode ? Colors.white : Colors.black),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(
                  color: darkMode ? Colors.white70 : Colors.black87,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: darkMode ? Colors.white54 : Colors.black54,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: darkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              style: TextStyle(color: darkMode ? Colors.white : Colors.black),
            ),
            IntlPhoneField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: darkMode ? Colors.white70 : Colors.black87,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: darkMode ? Colors.white54 : Colors.black54,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: darkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              style: TextStyle(color: darkMode ? Colors.white : Colors.black),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                _selectedCountryCode = phone.countryCode;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save the details
                String name = _nameController.text;
                String email = _emailController.text;
                String phone = '$_selectedCountryCode ${_phoneController.text}';

                // Implement your save functionality here

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Txt(
                      text: "Profile updated successfully",
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: darkMode ? Colors.blueGrey : Colors.blue,
              ),
              child: const Txt(
                text: "Save",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
