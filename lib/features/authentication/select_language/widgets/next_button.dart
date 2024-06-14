import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:only_click/features/authentication/sign_In/onboard_login/onboard_login.dart';

class BotButton extends StatelessWidget {
  const BotButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool isDark = brightnessValue == Brightness.dark;

    return ElevatedButton(
      onPressed: () {
        Get.to(() => const Onboard_login());
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: isDark ? Colors.blue : Colors.black,
        padding: const EdgeInsets.all(22.0),
      ),
      child: const Icon(
        Iconsax.arrow_right_3,
        color: Colors.white, // Icon color
      ),
    );
  }
}
