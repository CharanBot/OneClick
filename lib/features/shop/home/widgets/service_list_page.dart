import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:only_click/features/shop/home/widgets/portfolio_page.dart';
import 'package:only_click/nav_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  // Sample data for products
  static List<Product> sampleProducts = [
    Product(
      title: 'Venkata Sai Dheeraj',
      location: 'Italy',
      experience: 5,
      isAvailable: true,
      imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
      rating: 4.5,
      phoneNumber: '+91 7207262274',
    ),
    Product(
      title: 'Venu Charan',
      location: 'Ohio',
      experience: 3,
      isAvailable: true,
      imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
      rating: 4.0,
      phoneNumber: '+91 7207262274',
    ),
    Product(
      title: 'Phanishwar Jonnalagadda',
      location: 'Gujarat',
      experience: 4,
      isAvailable: true,
      imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
      rating: 3.5,
      phoneNumber: '+91 7207262274',
    ),
    Product(
      title: 'Shanmuka Jonnalagadda',
      location: 'Canada',
      experience: 6,
      isAvailable: false,
      imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
      rating: 4.8,
      phoneNumber: '+91 7207262274',
    ),
  ];

  void _showContactOptions(BuildContext context, Product product) {
    final navigationController = Get.find<NavigationController>();
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Contact ${product.title}',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Colors.teal,
            ),
          ),
          content: Text(
            'How would you like to contact this provider?',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.normal,
              color: darkMode ? Colors.white : Colors.black,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  const Text('Call', style: TextStyle(fontFamily: 'Poppins')),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: product.phoneNumber,
                );
                await launchUrl(launchUri); // Launch phone call
              },
            ),
            TextButton(
              child:
                  const Text('Chat', style: TextStyle(fontFamily: 'Poppins')),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                navigationController.goToChats();
              },
            ),
            TextButton(
              child: const Text('More Info...',
                  style: TextStyle(fontFamily: 'Poppins')),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PortfolioPage(product: product),
                ));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        title: const Text(
          'Service Providers',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Colors.teal),
        ),
        backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: sampleProducts.length,
          itemBuilder: (context, index) {
            final product = sampleProducts[index];
            return GestureDetector(
              onTap: () => _showContactOptions(context, product),
              child: Column(
                children: [
                  ProductCardWidget(
                    product: product,
                    darkMode: darkMode,
                    onContactPressed: () =>
                        _showContactOptions(context, product),
                  ),
                  if (product != sampleProducts.last)
                    Divider(
                      thickness: 0.2,
                      color: darkMode ? Colors.white : Colors.black,
                      indent: 136, // indent to align with image width + spacing
                      endIndent: 16,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final bool darkMode;
  final VoidCallback onContactPressed;

  const ProductCardWidget({
    Key? key,
    required this.product,
    required this.darkMode,
    required this.onContactPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cardColor = darkMode ? Colors.grey[900]! : Colors.white;
    Color textColor = darkMode ? Colors.white : Colors.black;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: cardColor,
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail Image with Favorite Icon
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: darkMode ? Colors.grey[800] : Colors.grey[300],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        product.imageAssetPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: FavoriteIcon(
                      darkMode: darkMode,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: textColor),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            product.location,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.work, color: textColor),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${product.experience} years of experience',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          product.isAvailable
                              ? Icons.check_circle
                              : Icons.cancel,
                          color:
                              product.isAvailable ? Colors.green : Colors.red,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          product.isAvailable ? 'Available' : 'Not Available',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Ratings Display with star_outline icon
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 195, 175, 0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    product.rating.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4), // Spacing between rating and icon
                  const Icon(
                    Icons.star_outline,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.teal),
              child: IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  Get.to(() => PortfolioPage(product: product));
                },
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  final bool darkMode;

  const FavoriteIcon({
    Key? key,
    required this.darkMode,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    Color? iconColor = isFavorite
        ? Colors.red
        : (widget.darkMode ? Colors.grey[800] : Colors.grey[200]);

    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.darkMode ? Colors.black : Colors.white,
        ),
        child: Center(
          child: Icon(
            Icons.favorite,
            size: 24,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

class Product {
  final String title;
  final String location;
  final int experience;
  final bool isAvailable;
  final String imageAssetPath;
  final double rating;
  final String phoneNumber;

  Product({
    required this.title,
    required this.location,
    required this.experience,
    required this.isAvailable,
    required this.imageAssetPath,
    required this.rating,
    required this.phoneNumber,
  });
}
