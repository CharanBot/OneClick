import 'package:flutter/material.dart';
import 'package:only_click/features/shop/home/widgets/service_list_page.dart';

class CategoryBottomSheet extends StatelessWidget {
  final String category;
  final List<String> variations;

  const CategoryBottomSheet({
    Key? key,
    required this.category,
    required this.variations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: darkMode ? const Color.fromARGB(255, 31, 23, 44) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: darkMode ? Colors.grey[700] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Center(
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                  color: darkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...variations.map((variation) => ListTile(
                  leading: Icon(
                    Icons.check_circle_outline,
                    color: darkMode ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    variation,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: darkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductListPage(),
                      ),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
