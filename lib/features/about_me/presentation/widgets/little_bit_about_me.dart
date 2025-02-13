import 'package:datiego/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:datiego/core/widgets/custom_box_decoration.dart';
import 'package:datiego/features/about_me/presentation/widgets/text_titel_about.dart';

/// ویجت "یکم درباره من"
///
/// این ویجت اطلاعات کوتاهی درباره کاربر را نمایش می‌دهد. از یک جعبه با طراحی خاص برای نمایش این اطلاعات استفاده می‌شود.
///
/// ## مثال استفاده:
/// ```dart
/// const LittleBitAboutMe()
/// ```
///
/// ## نکات:
/// - از `TextTitelAbout` برای نمایش عنوان بخش استفاده می‌شود.
/// - اطلاعات جزئی درباره کاربر از `AppConstants.littleBitAboutMe` گرفته می‌شود.
class LittleBitAboutMe extends StatelessWidget {
  const LittleBitAboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24), // فاصله درون جعبه
      decoration: customBoxDecoration(context), // طراحی خاص جعبه
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // تنظیم عمودی محتوای جعبه
        children: [
          const TextTitelAbout(
            text: "A little bit about me", // عنوان بخش
          ),
          const SizedBox(
            height: 16, // فاصله بین عنوان و متن
          ),
          Text(
            AppConstants
                .littleBitAboutMe, // متن کوتاهی درباره کاربر از اپ کانستنت
            style: Theme.of(context).textTheme.titleMedium, // استایل متن
          ),
        ],
      ),
    );
  }
}
