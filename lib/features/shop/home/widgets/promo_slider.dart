import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_click/features/shop/controllers/home_controller.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    Key? key,
    required this.banners,
  }) : super(key: key);

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    final bool darkMode = brightnessValue == Brightness.dark;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners
              .map((url) => TRoundedImage(
                    imageUrl: url,
                    padding: const EdgeInsets.all(5),
                  ))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? (darkMode ? Colors.white : Colors.black)
                        : Colors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TRoundedImage extends StatelessWidget {
  final String imageUrl;
  final EdgeInsets padding;

  const TRoundedImage({
    Key? key,
    required this.imageUrl,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isNetworkImage = imageUrl.startsWith('http');

    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: isNetworkImage
            ? Image.network(imageUrl, fit: BoxFit.cover)
            : Image.asset(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}

class TCircularContainer extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;
  final Color backgroundColor;

  const TCircularContainer({
    Key? key,
    required this.width,
    required this.height,
    this.margin = const EdgeInsets.all(0),
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class TSizes {
  static const double spaceBtwItems = 16.0;
}
