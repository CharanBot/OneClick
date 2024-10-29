import 'package:flutter/material.dart';
import 'package:only_click/features/shop/store/widgets/address_bottomsheet.dart';
import 'package:only_click/features/shop/store/widgets/categories.dart';
import 'package:only_click/features/shop/store/widgets/sliderrr.dart';

class RealStore extends StatelessWidget {
  const RealStore({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;
    final List<String> banners = [
      'assets/images/banners/banner_1.jpg',
      'assets/images/banners/banner_7.jpg',
      'assets/images/banners/banner_8.jpg',
    ];

    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Store',
              hintStyle: TextStyle(
                  color: darkMode ? Colors.grey : Colors.grey,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.mic),
              contentPadding: const EdgeInsets.only(top: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Address Selection
            GestureDetector(
              onTap: () => _showAddressBottomSheet(context),
              child: Container(
                color: Colors.teal[300],
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red[300]),
                    const SizedBox(width: 5),
                    Text(
                      'Deliver to [User] - Select Address',
                      style: TextStyle(
                          color: darkMode ? Colors.black : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins'),
                    ),
                    const Spacer(),
                    const Icon(Icons.expand_more, color: Colors.black),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Categories Section
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  store_category(
                      label: 'Electronics', icon: Icons.electrical_services),
                  store_category(
                      label: 'Furniture', icon: Icons.table_restaurant),
                  store_category(label: 'Gadgets', icon: Icons.plumbing),
                  store_category(label: 'Books', icon: Icons.garage_rounded),
                  store_category(label: 'Toys', icon: Icons.bolt),
                ],
              ),
            ),
            // Carousel Slider Section
            PromoSlider12(banners: banners),
          ],
        ),
      ),
    );
  }

  void _showAddressBottomSheet(BuildContext context) {
    address_bottomsheet(context);
  }
}
