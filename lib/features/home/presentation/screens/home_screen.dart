import 'package:datiego/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:datiego/core/di/service_locator.dart';
import 'package:datiego/features/home/presentation/bloc/home_bloc.dart';
import 'package:datiego/features/home/presentation/widgets/build_item_cards.dart';
import 'package:datiego/features/home/presentation/widgets/intro_section.dart';

/// صفحه اصلی برنامه (HomeScreen)
///
/// این کلاس یک صفحه فلاتر است که به عنوان صفحه اصلی برنامه عمل می‌کند.
/// از بلوک‌های BLoC برای مدیریت حالت و داده‌ها استفاده می‌کند.
class HomeScreen extends StatelessWidget {
  /// سازنده کلاس [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            // ایجاد نمونه‌ای از HomeBloc با استفاده از Service Locator
            // و ارسال رویداد GetProjectsHomeEvent برای دریافت پروژه‌ها.
            HomeBloc(getIt.get(), getIt.get())..add(GetProjectsHomeEvent()),
        child: const HomeBody(), // بدنه اصلی صفحه.
      ),
    );
  }
}

/// بدنه اصلی صفحه خانه
///
/// این کلاس شامل منطق نمایش المان‌های UI و مدیریت حالت‌های مختلف است.
class HomeBody extends StatelessWidget {
  /// سازنده کلاس [HomeBody]
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    // دریافت اندازه صفحه برای تنظیمات واکنش‌گرا.
    final size = MediaQuery.of(context).size;

    // بررسی حالت تاریک یا روشن بودن تم.
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode
              ? [
                  const Color(0x4a3E3B4F), // بنفش تیره نرم
                  const Color(0x4a4A4A6A), // آبی تیره نرم
                  const Color(0x4a3D5A6C), // فیروزه‌ای تیره نرم
                ]
              : [
                  const Color(0xFFFFD6E8), // صورتی روشن
                  const Color(0xFFE3E8FF), // آبی روشن
                  const Color(0xFFCFF0D6), // سبز روشن
                ],
        ),
      ),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // اینجا می‌توان عملیات جانبی مرتبط با تغییر حالت را انجام داد.
        },
        builder: (context, state) {
          // شرط نمایش کارت‌های آیتم:
          // - حالت موفقیت (HomeSuccesState) باشد.
          // - ماوس در ناحیه مورد نظر باشد یا روی کارت‌ها حرکت کرده باشد.
          // - عرض صفحه بیشتر از 800 پیکسل باشد.
          // - ارتفاع صفحه بیشتر از 600 پیکسل باشد.
          final showItemCard = (state is HomeSuccesState) &&
              (state.mouseRegion || state.hoveredOnItemCard) &&
              size.width > 800 &&
              size.height > 600;

          return Column(
            children: [
              Expanded(
                child: Stack(
                  alignment:
                      AlignmentDirectional.center, // هم‌ترازی المان‌ها در مرکز.
                  children: [
                    const SizedBox.expand(), // فضای خالی برای پوشش کل صفحه.
                    if (showItemCard)
                      buildItemCards(
                        state,
                        size.width,
                        size.height,
                      ), // نمایش کارت‌های آیتم در صورت برقراری شرایط.
                    const Responsive(
                      desktop: IntroSection(
                        fontSize: 36,
                        height: 235,
                        width: 435,
                        sizeimage: 50,
                      ), // تنظیمات بخش معرفی برای دسکتاپ.
                      mobile: IntroSection(
                        fontSize: 24,
                        height: 178,
                        width: 290,
                        sizeimage: 30,
                      ), // تنظیمات بخش معرفی برای موبایل.
                    )
                  ],
                ),
              ),
              const SizedBox(height: 80), // فاصله عمودی در پایین صفحه.
            ],
          );
        },
      ),
    );
  }
}
