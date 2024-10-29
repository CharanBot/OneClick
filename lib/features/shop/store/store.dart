import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    final List<Map<String, String>> section1Data = [
      {
        'imageUrl': 'assets/images/banners/store_img1.png',
        'title': 'Company 1',
        'location': 'Location 1',
      },
      {
        'imageUrl': 'assets/images/banners/store_img2.png',
        'title': 'Company 2',
        'location': 'Location 2',
      },
      {
        'imageUrl': 'assets/images/banners/sample_banner3.jpg',
        'title': 'Company 3',
        'location': 'Location 3',
      },
    ];

    final List<Map<String, String>> section2Data = [
      {
        'imageUrl': 'assets/images/banners/sample_banner1.jpg',
        'title': 'Company 4',
        'location': 'Location 4',
      },
      {
        'imageUrl': 'assets/images/banners/sample_banner2.jpg',
        'title': 'Company 5',
        'location': 'Location 5',
      },
      {
        'imageUrl': 'assets/images/banners/sample_banner3.jpg',
        'title': 'Company 6',
        'location': 'Location 6',
      },
    ];

    final List<Map<String, String>> section3Data = [
      {
        'imageUrl': 'assets/images/banners/sample_banner1.jpg',
        'title': 'Company 7',
        'location': 'Location 7',
      },
      {
        'imageUrl': 'assets/images/banners/sample_banner2.jpg',
        'title': 'Company 8',
        'location': 'Location 8',
      },
      {
        'imageUrl': 'assets/images/banners/sample_banner3.jpg',
        'title': 'Company 9',
        'location': 'Location 9',
      },
    ];

    return Scaffold(
      backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        title: Text('Store',
            style: TextStyle(
                color: darkMode ? Colors.teal : Colors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500)),
        backgroundColor: darkMode ? Colors.grey[900] : Colors.white,
        iconTheme: IconThemeData(color: darkMode ? Colors.white : Colors.black),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSection(
                context, 'Construction companies', section1Data, darkMode),
            buildDivider(darkMode),
            buildSection(context, 'Car Mods', section2Data, darkMode),
            buildDivider(darkMode),
            buildSection(context, 'Build Furniture', section3Data, darkMode),
          ],
        ),
      ),
    );
  }

  Widget buildSection(BuildContext context, String title,
      List<Map<String, String>> data, bool darkMode) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  fontSize: 21,
                  color: darkMode ? Colors.white : Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerRight,
                ),
                child: Text(
                  'view all',
                  style: TextStyle(
                    fontSize: 11,
                    color: darkMode ? Colors.blue[200] : Colors.blue,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: data.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CustomWidget(
                  imageUrl: item['imageUrl']!,
                  title: item['title']!,
                  location: item['location']!,
                  darkMode: darkMode,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(bool darkMode) {
    return SizedBox(
      height: 5.0, // Height of the divider
      child: Container(
        color: darkMode
            ? Colors.grey.withOpacity(0.35)
            : Colors.grey.withOpacity(0.3),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final bool darkMode;

  const CustomWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.darkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 297,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: darkMode ? Colors.grey[800] : Colors.grey[300],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Image.asset(
                    imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    color: darkMode ? Colors.black : Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: darkMode ? Colors.teal : Colors.black,
                            ),
                          ),
                          Text(
                            location,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              color: darkMode
                                  ? Colors.grey[400]
                                  : Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: FavoriteIcon(darkMode: darkMode),
            ),
          ],
        ),
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
        width: 50,
        height: 50,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.darkMode ? Colors.black : Colors.white,
        ),
        child: Center(
          child: Icon(
            Icons.favorite,
            size: 34,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
