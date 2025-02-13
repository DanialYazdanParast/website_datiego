import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:datiego/core/router/go_router.dart';
import 'package:datiego/core/widgets/image_loding_service.dart';
import 'package:datiego/features/home/presentation/bloc/home_bloc.dart';
import 'package:datiego/features/shared/domain/entities/projects_entities.dart';

/// ویجت کارت آیتم برای نمایش پروژه‌ها در صفحه اصلی.
///
/// این کلاس یک ویجت است که اطلاعات یک پروژه را به صورت یک کارت تصویری نمایش می‌دهد.
/// این کارت شامل تصویر پروژه است و با استفاده از انیمیشن‌ها و طراحی واکنش‌گرا جذابیت بصری دارد.
/// هنگام کلیک بر روی کارت، کاربر به صفحه جزئیات پروژه هدایت می‌شود.
///
/// ## پارامترها:
/// - [width]: عرض صفحه برای تنظیمات واکنش‌گرا.
/// - [height]: ارتفاع صفحه برای تنظیمات واکنش‌گرا.
/// - [alignmentx]: موقعیت افقی کارت در صفحه.
/// - [alignmenty]: موقعیت عمودی کارت در صفحه.
/// - [angle]: زاویه چرخش کارت.
/// - [project]: داده‌های پروژه که شامل تصویر و عنوان است.
///
/// ## قابلیت‌های کلیدی:
/// - استفاده از `GestureDetector` برای مدیریت رویداد کلیک و هدایت کاربر به صفحه جزئیات.
/// - استفاده از `MouseRegion` برای تشخیص حرکت ماوس و به‌روزرسانی حالت BLoC.
/// - نمایش تصویر پروژه با استفاده از `ImageLodingService` و اضافه کردن انیمیشن‌های ظهور و مقیاس.
class ItemCardHome extends StatelessWidget {
  /// سازنده کلاس [ItemCardHome]
  ///
  /// - [width]: عرض صفحه برای تنظیمات واکنش‌گرا.
  /// - [height]: ارتفاع صفحه برای تنظیمات واکنش‌گرا.
  /// - [alignmentx]: موقعیت افقی کارت در صفحه.
  /// - [alignmenty]: موقعیت عمودی کارت در صفحه.
  /// - [angle]: زاویه چرخش کارت.
  /// - [project]: داده‌های پروژه که شامل تصویر و عنوان است.
  const ItemCardHome({
    super.key,
    required this.width,
    required this.height,
    required this.alignmentx,
    required this.alignmenty,
    required this.angle,
    required this.project,
  });

  final double width;
  final double height;
  final double alignmentx;
  final double alignmenty;
  final double angle;
  final ProjectsEntities project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // هدایت کاربر به صفحه جزئیات پروژه با استفاده از GoRouter.
        final encodedTitle = Uri.encodeComponent(project.title!);
        context.go(
          '${ScreenGoRouter.projects}/$encodedTitle',
          extra: project, // ارسال داده‌های پروژه به صفحه مقصد.
        );
      },
      child: Align(
        alignment: Alignment(alignmentx, alignmenty), // تنظیم موقعیت کارت.
        child: MouseRegion(
          cursor: SystemMouseCursors.click, // تغییر شکل ماوس به حالت کلیک.
          onEnter: (_) => context.read<HomeBloc>().add(
              const SetHoveredOnItemCardEvent(true)), // فعال‌سازی حالت هاور.
          onExit: (_) => context.read<HomeBloc>().add(
              const SetHoveredOnItemCardEvent(
                  false)), // غیرفعال‌سازی حالت هاور.
          child: Transform.rotate(
            angle: angle, // چرخش کارت به اندازه زاویه مشخص شده.
            child: SizedBox(
              height: 170, // ارتفاع ثابت کارت.
              width: 220, // عرض ثابت کارت.
              child: ImageLodingService(
                imageUrl: project.image!, // نمایش تصویر پروژه.
                borderRadius: BorderRadius.circular(15), // گردی گوشه‌ها.
              ),
            ),
          ),
        ),
      )
          .animate() // اضافه کردن انیمیشن.
          .fadeIn() // انیمیشن ظهور تدریجی.
          .scale(), // انیمیشن مقیاس.
    );
  }
}
