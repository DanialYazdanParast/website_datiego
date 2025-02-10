import 'package:flutter/material.dart';
import 'package:Datiego/core/widgets/image_loding_service.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1.5,
      child: SizedBox(
        width: double.infinity,
        child: ImageLodingService(
          imageUrl: imageUrl,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
