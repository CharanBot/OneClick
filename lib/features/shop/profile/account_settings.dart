import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:only_click/Constants_profile/Constants.dart';
import 'package:only_click/Widgets_profile/Widgets.dart';
import 'package:only_click/features/shop/profile/pages/edit_profile.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : const Color(0xffffffff),
      body: ListView(
        padding: const EdgeInsets.all(12),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(height: 35),
          userTile(darkMode),
          divider(darkMode),
          colorTiles(darkMode),
          divider(darkMode),
          bwTiles(darkMode),
        ],
      ),
    );
  }

  Widget userTile(bool darkMode) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(Urls.avatar1),
      ),
      title: Txt(
        text: "Tangella Naga Charan",
        fontWeight: FontWeight.bold,
        color: darkMode ? Colors.white : Colors.black,
      ),
      subtitle: Txt(
        text: "+91 7207262274",
        color: darkMode ? Colors.white70 : Colors.black87,
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.edit,
          color: darkMode ? Colors.white : Colors.black,
        ),
        onPressed: () {
          Get.to(() => const EditProfilePage());
        },
      ),
    );
  }

  Widget divider(bool darkMode) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1.5,
        color: darkMode ? Colors.white54 : Colors.black54,
      ),
    );
  }

  Widget colorTiles(bool darkMode) {
    return Column(
      children: [
        colorTile(Icons.format_list_numbered, Colors.white,
            const Color.fromARGB(255, 59, 59, 59), "My bookings", darkMode),
        colorTile(Icons.credit_card, Colors.green,
            const Color.fromARGB(255, 0, 122, 4), "Payment methods", darkMode),
        colorTile(
            Icons.location_on,
            Colors.red,
            const Color.fromARGB(255, 222, 52, 40),
            "Manage addresses",
            darkMode),
        colorTile(
            Icons.auto_awesome,
            Colors.yellowAccent,
            const Color.fromARGB(255, 189, 170, 0),
            "Plus membership",
            darkMode),
        colorTile(
            Icons.grade, Colors.orange, Colors.yellow, "My rating", darkMode),
        colorTile(Icons.wallet, const Color.fromARGB(255, 172, 134, 121),
            Colors.brown, "Wallet", darkMode),
        colorTile(Icons.settings_outlined, Colors.blue, Colors.blue, "Settings",
            darkMode),
      ],
    );
  }

  Widget bwTiles(bool darkMode) {
    return Column(
      children: [
        bwTile(Icons.info_outline, Colors.white, Colors.black, "About Us",
            darkMode),
        bwTile(Icons.textsms_outlined, Colors.white, Colors.black,
            "Chat with Us", darkMode),
        bwTile(Icons.contact_phone, Colors.white, Colors.black, "Contact Us",
            darkMode),
      ],
    );
  }

  Widget bwTile(IconData icon, Color darkColor, Color lightColor, String text,
      bool darkMode) {
    return colorTile(icon, darkColor, lightColor, text, darkMode,
        blackAndWhite: true);
  }

  Widget colorTile(IconData icon, Color darkColor, Color lightColor,
      String text, bool darkMode,
      {bool blackAndWhite = false}) {
    Color? pickedColor = darkMode ? Colors.grey[800] : const Color(0xfff3f4fe);
    Color iconColor = darkMode ? darkColor : lightColor;

    return ListTile(
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: blackAndWhite ? pickedColor : iconColor.withOpacity(0.09),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Txt(
        text: text,
        fontWeight: FontWeight.w500,
        color: darkMode ? Colors.white : Colors.black,
      ),
      trailing: Icon(Icons.arrow_forward_ios,
          color: darkMode ? Colors.white : Colors.black, size: 20),
      onTap: () {},
    );
  }
}
