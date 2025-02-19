import 'package:datiego/confing/theme/app_theme.dart';
import 'package:datiego/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:datiego/core/constants/app_constants.dart';
import 'package:datiego/core/services/url_launcher_service.dart';
import 'package:datiego/core/widgets/custom_border.dart';
import 'package:datiego/features/about_me/presentation/widgets/text_titel_about.dart';

/// ویجت شبکه‌های اجتماعی
///
/// این ویجت شامل دکمه‌های ارتباطی است که کاربران می‌توانند از طریق آنها با شما ارتباط برقرار کنند.
/// دکمه‌ها شامل ایمیل، گیت‌هاب، لینکدین، اینستاگرام و شماره تلفن هستند.
/// از `UrlLauncherService` برای باز کردن لینک‌ها و انجام تماس‌های تلفنی استفاده می‌شود.
///
/// ## نکات:
/// - از `CustomButton` برای نمایش هر دکمه استفاده می‌شود.
/// - هر دکمه یک آیکون و متن دارد که با رنگ‌های مختلف طراحی شده است.
class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final urlLauncher = GetIt.instance<UrlLauncherService>();
    final themeConfig = MyAppThemeConfig.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary, // رنگ پس‌زمینه
        borderRadius: BorderRadius.circular(32), // تنظیم گوشه‌های گرد
        border: customBorder(context), // حاشیه سفارشی
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTitelAbout(
            text: "Come and say hi! ", // عنوان قسمت شبکه‌های اجتماعی
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              // دکمه ارسال ایمیل
              CustomButton(
                onTap: () async {
                  await urlLauncher.sendEmail('danialyazdan77@gmail.com');
                },
                color: themeConfig.green,
                icon: Icons.email_outlined,
                text: "danialyazdan77@gmail.com",
              ),
              const SizedBox(height: 10),
              // دکمه گیت‌هاب
              CustomButton(
                onTap: () async {
                  await urlLauncher.openUrl(AppConstants.gitHubUrl);
                },
                color: themeConfig.gray,
                icon: FontAwesomeIcons.github,
                text: "github.com/DanialYazdanParast",
              ),
              const SizedBox(height: 10),
              // دکمه لینکدین
              CustomButton(
                onTap: () async {
                  await urlLauncher.openUrl(AppConstants.linkedinUrl);
                },
                color: themeConfig.skyBlue,
                icon: FontAwesomeIcons.linkedin,
                text: "linkedin.com/DanialYazdanParast",
              ),
              const SizedBox(height: 10),
              // دکمه اینستاگرام
              CustomButton(
                onTap: () async {
                  await urlLauncher.openUrl(AppConstants.instagramUrl);
                },
                color: themeConfig.pink,
                icon: FontAwesomeIcons.instagram,
                text: "instagram.com/datiego",
              ),
              const SizedBox(height: 10),
              // دکمه تماس تلفنی
              CustomButton(
                onTap: () async {
                  await urlLauncher.makePhoneCall(AppConstants.phoneNumbercall);
                },
                color: themeConfig.peach,
                icon: Icons.phone_outlined,
                text: AppConstants.phoneNumber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
