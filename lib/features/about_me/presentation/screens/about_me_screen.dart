import 'package:datiego/core/utils/responsive.dart';
import 'package:datiego/features/about_me/presentation/widgets/about_me_desktop.dart';
import 'package:datiego/features/about_me/presentation/widgets/about_me_mobile.dart';
import 'package:flutter/material.dart';

/// صفحه‌ی "درباره من" که به صورت واکنش‌گرا برای دستگاه‌های موبایل و دسکتاپ طراحی شده است.
///
/// این صفحه از دو ویجت مجزا برای نمایش در دستگاه‌های موبایل و دسکتاپ استفاده می‌کند:
/// - `AboutMeMobile` برای دستگاه‌های موبایل.
/// - `AboutMeDesktop` برای دستگاه‌های دسکتاپ.
///
/// ## مثال استفاده:
/// ```dart
/// const AboutMeScreen()
/// ```
///
/// ## نکات:
/// - از `Responsive` برای تشخیص نوع دستگاه و نمایش ویجت مناسب استفاده می‌شود.
/// - `ScrollController` برای مدیریت اسکرول صفحه به اشتراک گذاشته شده است.
class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose(); // آزادسازی کنترلر اسکرول
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Responsive(
        desktop: AboutMeDesktop(
            scrollController: scrollController, width: width), // نسخه دسکتاپ
        mobile: AboutMeMobile(
            scrollController: scrollController, width: width), // نسخه موبایل
      ),
    );
  }
}
