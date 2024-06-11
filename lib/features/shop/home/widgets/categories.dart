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
              for (final category in ['Plumber', 'Carpenter', 'Mechanic'])
                TVerticalImageText(
                  image:
                      'https://via.placeholder.com/150', // Adjusted image size
                  title: category,
                  width: imageWidth,
                  onTap: () => Get.to(() =>
                      const SubCategoriesScreen()), // Replace with your navigation logic
                ),
            ],
          ),
        ),
        SizedBox(
          height: 130,
          child: Row(
            children: [
              for (final category in ['Saloom', 'Electrician', 'Hard ware'])
                TVerticalImageText(
                  image:
                      'https://via.placeholder.com/150', // Adjusted image size
                  title: category,
                  width: imageWidth,
                  onTap: () => Get.to(() =>
                      const SubCategoriesScreen()), // Replace with your navigation logic
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class TVerticalImageText extends StatelessWidget {
  final String image;
  final String title;
  final double width;
  final VoidCallback onTap;

  const TVerticalImageText({
    Key? key,
    required this.image,
    required this.title,
    required this.width,
    required this.onTap,
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
              child: Image.network(
                image,
                width: width - 5.39, // Set the image width
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
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

void main() {
  runApp(GetMaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Home Categories'),
      ),
      body: const THomeCategories(),
    ),
  ));
}
