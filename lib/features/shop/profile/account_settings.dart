import 'package:flutter/material.dart';
import 'package:one_click/Constants/Constants.dart';
import 'package:one_click/Widgets/Widgets.dart';

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
        physics:
            const BouncingScrollPhysics(), //use this for a bouncing experience
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
        text: "Flutter Developer",
        color: darkMode ? Colors.white70 : Colors.black87,
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
        colorTile(
            Icons.person_outline, Colors.deepPurple, "Personal data", darkMode),
        colorTile(Icons.settings_outlined, Colors.blue, "Settings", darkMode),
        colorTile(Icons.credit_card, Colors.pink, "Payment", darkMode),
        colorTile(
            Icons.favorite_border, Colors.orange, "Personal data", darkMode),
      ],
    );
  }

  Widget bwTiles(bool darkMode) {
    return Column(
      children: [
        bwTile(Icons.info_outline, "FAQs", darkMode),
        bwTile(Icons.border_color_outlined, "Handbook", darkMode),
        bwTile(Icons.textsms_outlined, "Community", darkMode),
      ],
    );
  }

  Widget bwTile(IconData icon, String text, bool darkMode) {
    return colorTile(icon, Colors.black, text, darkMode, blackAndWhite: true);
  }

  Widget colorTile(IconData icon, Color color, String text, bool darkMode,
      {bool blackAndWhite = false}) {
    Color? pickedColor = darkMode ? Colors.grey[800] : const Color(0xfff3f4fe);
    return ListTile(
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: blackAndWhite ? pickedColor : color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Icon(icon, color: color),
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
