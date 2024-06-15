import 'package:flutter/material.dart';
import 'category_bottom_sheet.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = (screenWidth - 32 - 16 * 2) /
        3; // Calculating image width based on screen width and padding

    final categories = [
      {
        'title': 'Plumbing',
        'image': 'assets/icons/categories/plumbing.png',
        'variations': ['Pipe Fitting', 'Leak Repair', 'Drain Cleaning']
      },
      {
        'title': 'Carpenter',
        'image': 'assets/icons/categories/Carpenter.png',
        'variations': [
          'Furniture Making',
          'Wood Repair',
          'Cabinet Installation'
        ]
      },
      {
        'title': 'Mechanic',
        'image': 'assets/icons/categories/Mechanic.png',
        'variations': ['Engine Repair', 'Oil Change', 'Brake Repair']
      },
      {
        'title': 'Cleaning',
        'image': 'assets/icons/categories/Mopping Girl.png',
        'variations': ['House Cleaning', 'Office Cleaning', 'Window Cleaning']
      },
      {
        'title': 'Electrician',
        'image': 'assets/icons/categories/Electrician.png',
        'variations': ['Wiring', 'Light Installation', 'Socket Repair']
      },
      {
        'title': 'Painting',
        'image': 'assets/icons/categories/Decorator.png',
        'variations': [
          'Wall Painting',
          'Furniture Painting',
          'Exterior Painting'
        ]
      },
    ];

    return Column(
      children: [
        SizedBox(
          height: 130,
          child: Row(
            children: categories.sublist(0, 3).map((category) {
              return TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: category['title'] as String,
                width: imageWidth,
                onTap: () => showCategoryBottomSheet(
                    context,
                    category['title'] as String,
                    category['variations'] as List<String>),
                assetImage: category['image'] as String,
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 130,
          child: Row(
            children: categories.sublist(3, 6).map((category) {
              return TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: category['title'] as String,
                width: imageWidth,
                onTap: () => showCategoryBottomSheet(
                    context,
                    category['title'] as String,
                    category['variations'] as List<String>),
                assetImage: category['image'] as String,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  void showCategoryBottomSheet(
      BuildContext context, String category, List<String> variations) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CategoryBottomSheet(
          category: category,
          variations: variations,
        );
      },
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
