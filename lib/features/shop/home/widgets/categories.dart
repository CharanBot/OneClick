import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = (screenWidth - 32 - 16 * 2) /
        3; // Calculating image width based on screen width and padding

    return Column(
      children: [
        SizedBox(
          height: 130,
          child: Row(
            children: [
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Plumbing',
                width: imageWidth,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
                assetImage: 'assets/icons/categories/plumbing.png',
              ),
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Carpenter',
                width: imageWidth,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
                assetImage: 'assets/icons/categories/Carpenter.png',
              ),
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Mechanic',
                width: imageWidth,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
                assetImage: 'assets/icons/categories/Mechanic.png',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 130,
          child: Row(
            children: [
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Cleaning',
                width: imageWidth,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
                assetImage: 'assets/icons/categories/Mopping Girl.png',
              ),
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Electrician',
                width: imageWidth,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
                assetImage: 'assets/icons/categories/Electrician.png',
              ),
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Painting',
                width: imageWidth,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
                assetImage: 'assets/icons/categories/Decorator.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TVerticalImageText extends StatelessWidget {
  final Color color;
  final String title;
  final double width;
  final VoidCallback onTap;
  final String? assetImage;

  const TVerticalImageText({
    Key? key,
    required this.color,
    required this.title,
    required this.width,
    required this.onTap,
    this.assetImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: width - 5.39,
                height: 80,
                color: color,
                child: assetImage != null
                    ? Padding(
                        padding:
                            const EdgeInsets.all(8.0), // padding here for image
                        child: Image.asset(
                          assetImage!,
                          fit: BoxFit.contain,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Raleway',
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub Categories'),
      ),
      body: const Center(
        child: Text('Sub Categories Content'),
      ),
    );
  }
}
