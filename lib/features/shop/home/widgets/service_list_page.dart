import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  // Sample data for products
  static List<Product> sampleProducts = [
    Product(
      title: 'Venkata Sai Dheeraj',
      category: 'Burger',
      imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
      price: '\$45',
    ),
    Product(
      title: 'Venu Charan',
      category: 'Pizza',
      imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
      price: '\$30',
    ),
    Product(
      title: 'Phanishwar Jonnalagadda',
      category: 'Salad',
      imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
      price: '\$20',
    ),
    Product(
      title: 'Shanmuka Jonnalagadda',
      category: 'Sandwich',
      imageAssetPath: 'assets/icons/mostbooked/laptop_repair.jpg',
      price: '\$15',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        title: const Text('Service Providers'),
        backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16), //space above the first card

            // Products list
            Column(
              children: sampleProducts.map((product) {
                return Column(
                  children: [
                    ProductCardWidget(
                      product: product,
                      darkMode: darkMode,
                    ),
                    if (product !=
                        sampleProducts.last) // Added divider conditionally
                      Divider(
                        thickness: 0.2,
                        color: darkMode ? Colors.white : Colors.black,
                        indent:
                            136, // indent to align with image width + spacing
                        endIndent: 16,
                      ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final bool darkMode;

  const ProductCardWidget({
    Key? key,
    required this.product,
    required this.darkMode,
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
      child: Row(
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
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.category,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Pricing
                    Text(
                      product.price,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    // next button icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkMode ? Colors.grey[800] : Colors.grey[200],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: () {},
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ],
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
            color: iconColor, // Use iconColor to dynamically set the icon color
          ),
        ),
      ),
    );
  }
}

class Product {
  final String title;
  final String category;
  final String imageAssetPath;
  final String price;

  Product({
    required this.title,
    required this.category,
    required this.imageAssetPath,
    required this.price,
  });
}
