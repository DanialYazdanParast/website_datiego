import 'package:flutter/material.dart';
import 'package:website_datiego/core/widgets/image_loding_service.dart';

class ImageProject extends StatelessWidget {
  const ImageProject({
    super.key,
    required this.screenHeight,
    required this.imageUrl,
  });

  final double screenHeight;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: screenHeight * 0.8,
      child: ImageLodingService(
        imageUrl: imageUrl,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
