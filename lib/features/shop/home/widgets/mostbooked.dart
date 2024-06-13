import 'package:flutter/material.dart';

class Mostbookedcategories extends StatelessWidget {
  const Mostbookedcategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = (screenWidth - 32 - 16 * 2) / 3;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Bride make up',
                usageCount: '33.6k',
                serviceProviderCount: '120',
                width: imageWidth,
                onTap: () {},
                assetImage: 'assets/icons/mostbooked/bride_makeup.png',
              ),
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Sofa Cleaning',
                usageCount: '27.8k',
                serviceProviderCount: '85',
                width: imageWidth,
                onTap: () {},
                assetImage: 'assets/icons/mostbooked/sofa-cleaning.jpg',
              ),
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'AC repair and service',
                usageCount: '14.3k',
                serviceProviderCount: '40',
                width: imageWidth,
                onTap: () {},
                assetImage: 'assets/icons/mostbooked/ac-repair.jpg',
              ),
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Plumbing and Toilet cleaning',
                usageCount: '22.4k',
                serviceProviderCount: '95',
                width: imageWidth,
                onTap: () {},
                assetImage: 'assets/icons/mostbooked/toilet_cleaning.jpg',
              ),
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Laptop/PC repair & virus removal',
                usageCount: '18.7k',
                serviceProviderCount: '65',
                width: imageWidth,
                onTap: () {},
                assetImage: 'assets/icons/mostbooked/laptop_repair.jpg',
              ),
              TVerticalImageText(
                color: const Color.fromARGB(255, 243, 243, 243),
                title: 'Painting a room',
                usageCount: '9.5k',
                serviceProviderCount: '30',
                width: imageWidth,
                onTap: () {},
                assetImage:
                    'assets/icons/mostbooked/house-painting-services.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TVerticalImageText extends StatelessWidget {
  final Color color;
  final String title;
  final String usageCount;
  final String serviceProviderCount;
  final double width;
  final VoidCallback onTap;
  final String? assetImage;

  const TVerticalImageText({
    Key? key,
    required this.color,
    required this.title,
    required this.usageCount,
    required this.serviceProviderCount,
    required this.width,
    required this.onTap,
    this.assetImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width + 20,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: color,
                image: assetImage != null
                    ? DecorationImage(
                        image: AssetImage(assetImage!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: width + 20,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.people,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  usageCount,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.home_repair_service,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  serviceProviderCount,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
