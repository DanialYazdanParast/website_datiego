import 'package:flutter/material.dart';
import 'package:datiego/core/widgets/image_loding_service.dart';

/// یک ویجت برای نمایش تصویر با جزئیات بیشتر و نسبت ابعاد مشخص.
///
/// این ویجت از `AspectRatio` برای حفظ نسبت ابعاد تصویر و `ImageLodingService`
/// برای نمایش تصویر با قابلیت لودینگ و گرد کردن گوشه‌ها استفاده می‌کند.
///
/// پارامترها:
/// - [imageUrl]: آدرس URL تصویر که باید نمایش داده شود.
///
/// مثال استفاده:
/// ```dart
/// ImageDetail(
///   imageUrl: 'https://example.com/image.jpg',
/// );
/// ```
class ImageDetail extends StatelessWidget {
  const ImageDetail({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1.5, // نسبت ابعاد تصویر (عرض به ارتفاع)
      child: SizedBox(
        width: double.infinity, // عرض کامل
        child: ImageLodingService(
          imageUrl: imageUrl, // آدرس URL تصویر
          borderRadius: BorderRadius.circular(15), // گرد کردن گوشه‌ها
        ),
      ),
    );
  }
}
