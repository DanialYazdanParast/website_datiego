import 'package:datiego/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:datiego/core/constants/app_colors.dart';
import 'package:datiego/core/widgets/custom_border.dart';
import 'package:datiego/core/widgets/custom_box_decoration.dart';
import 'package:datiego/features/about_me/presentation/widgets/text_titel_about.dart';

/// ویجت معرفی پروفایل
///
/// این ویجت برای نمایش معرفی کوتاهی از کاربر به همراه تصویر و اطلاعات اضافی مانند محل سکونت و متن معرفی استفاده می‌شود.
/// این ویجت شامل:
/// - یک تصویر از کاربر
/// - متن خوشامدگویی و معرفی
/// - محل سکونت کاربر (شهر و کشور)
///
/// ## مثال استفاده:
/// ```dart
/// const ProfileIntroWidget()
/// ```
///
/// ## نکات:
/// - از `customBoxDecoration` برای طراحی جعبه استفاده شده است.
/// - از `customBorder` برای افزودن حاشیه به بخش‌ها استفاده شده است.
class ProfileIntroWidget extends StatelessWidget {
  const ProfileIntroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.95,
      padding: const EdgeInsets.all(24),
      decoration: customBoxDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // تصویر پروفایل
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/aaaa.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // متن خوشامدگویی
          Row(
            children: [
              const TextTitelAbout(
                text: "Hey again ",
              ),
              Image.asset(
                'assets/waving-hand.png',
                height: 26,
                width: 26,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // معرفی متن
          Text(
            AppConstants.profileIntro,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          // اطلاعات محل سکونت
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(8),
                  border: customBorder(context),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: LightThemeColors.textSecondary,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Shiraz, Iran", // محل سکونت
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
