import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PromoSlider12 extends StatefulWidget {
  final List<String> banners;

  const PromoSlider12({super.key, required this.banners});

  @override
  State<PromoSlider12> createState() => _PromoSlider12State();
}

class _PromoSlider12State extends State<PromoSlider12> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool darkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.banners.map((url) {
            return Image.asset(
              url,
              fit: BoxFit.cover,
              width: double.infinity,
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.banners.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => setState(() {
                _currentIndex = entry.key;
              }),
              child: Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? (darkMode ? Colors.white : Colors.black)
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
