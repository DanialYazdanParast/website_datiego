import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLodingService extends StatelessWidget {
  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit boxFit;

  const ImageLodingService({
    required this.imageUrl,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.boxFit = BoxFit.cover,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        placeholder: (context, url) => Container(
          color: Colors.grey,
        ),
        imageUrl: imageUrl,
        fit: boxFit,
      ),
    );
  }
}
