import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:only_click/features/authentication/select_language/select_language.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        // Define the light theme
        brightness: Brightness.light,
        // Customize other light theme properties as needed
        // For example:
        // primaryColor: Colors.white,
        // accentColor: Colors.blue,
        // ...
      ),
      darkTheme: ThemeData(
        // Define the dark theme
        brightness: Brightness.dark,
        // Customize other dark theme properties as needed
        // For example:
        // primaryColor: Colors.black,
        // accentColor: Colors.blue,
        // ...
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: SelectLanguage(),
      ),
    );
  }
}
