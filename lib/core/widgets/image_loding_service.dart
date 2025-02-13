import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// یک ویجت برای نمایش تصاویر از URL با قابلیت کش (Cache) و لودینگ.
///
/// این ویجت از پکیج `cached_network_image` برای نمایش تصاویر از URL استفاده می‌کند.
/// همچنین قابلیت کش تصاویر، نمایش placeholder هنگام لودینگ و گرد کردن گوشه‌ها را فراهم می‌کند.
///
/// پارامترها:
/// - [imageUrl]: آدرس URL تصویر که باید نمایش داده شود.
/// - [borderRadius]: شعاع گردی گوشه‌های تصویر (پیش‌فرض: بدون گردی).
/// - [boxFit]: نحوه تطبیق تصویر در فضای موجود (پیش‌فرض: `BoxFit.cover`).
///
/// مثال استفاده:
/// ```dart
/// ImageLodingService(
///   imageUrl: 'https://example.com/image.jpg',
///   borderRadius: BorderRadius.circular(15),
///   boxFit: BoxFit.contain,
/// );
/// ```
class ImageLodingService extends StatelessWidget {
  final String imageUrl;
  final BorderRadius borderRadius;
  final BoxFit boxFit;

  const ImageLodingService({
    required this.imageUrl,
    this.borderRadius =
        const BorderRadius.all(Radius.circular(0)), // پیش‌فرض: بدون گردی
    this.boxFit = BoxFit.cover, // پیش‌فرض: تطبیق تصویر با فضای موجود
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius, // گرد کردن گوشه‌های تصویر
      child: CachedNetworkImage(
        placeholder: (context, url) => Container(
          // نمایش placeholder هنگام لودینگ تصویر
          color: Theme.of(context)
              .colorScheme
              .onSecondary, // رنگ پس‌زمینه placeholder
        ),
        imageUrl: imageUrl, // آدرس URL تصویر
        fit: boxFit, // نحوه تطبیق تصویر
      ),
    );
  }
}
