import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Store',
            style: TextStyle(color: darkMode ? Colors.white : Colors.black)),
        backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
        iconTheme: IconThemeData(color: darkMode ? Colors.white : Colors.black),
      ),
      body: Center(
        child: Text(
          'This is the Store Screen',
          style: TextStyle(
            fontSize: 20,
            color: darkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
