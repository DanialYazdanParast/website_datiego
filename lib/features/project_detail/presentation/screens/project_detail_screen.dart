import 'package:datiego/confing/theme/app_theme.dart';
import 'package:datiego/core/services/url_launcher_service.dart';
import 'package:datiego/core/utils/responsive.dart';
import 'package:datiego/core/widgets/custom_button.dart';
import 'package:datiego/core/widgets/description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:datiego/core/widgets/custom_close_button.dart';
import 'package:datiego/core/widgets/image_detail.dart';
import 'package:datiego/core/widgets/tag_project.dart';
import 'package:datiego/core/widgets/text_title.dart';
import 'package:datiego/features/shared/domain/entities/projects_entities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

/// صفحه جزئیات پروژه.
///
/// این کلاس یک صفحه فلاتر است که جزئیات یک پروژه را نمایش می‌دهد.
/// شامل تصویر، عنوان، تگ‌ها، توضیحات و لینک GitHub پروژه است.
/// از انیمیشن‌ها و طراحی واکنش‌گرا برای بهبود تجربه کاربری استفاده می‌کند.
class ProjectDetailScreen extends StatefulWidget {
  /// سازنده کلاس [ProjectDetailScreen].
  ///
  /// - [project]: داده‌های مربوط به پروژه که شامل تصویر، عنوان، تگ‌ها، توضیحات و لینک GitHub است.
  const ProjectDetailScreen({
    super.key,
    required this.project,
  });

  final ProjectsEntities project;

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  /// حاشیه افقی پیش‌فرض برای المان‌های صفحه.
  double horizontalPadding = 20.0;

  /// کنترل‌کننده اسکرول برای مدیریت حرکت در صفحه.
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    /// آزادسازی منابع مرتبط با کنترل‌کننده اسکرول.
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// دریافت سرویس `UrlLauncherService` برای باز کردن لینک‌ها.
    final urlLauncher = GetIt.instance<UrlLauncherService>();

    /// دریافت عرض صفحه برای تنظیم حاشیه‌ها به صورت واکنش‌گرا.
    final screenWidth = MediaQuery.of(context).size.width;

    /// تنظیم حاشیه افقی بر اساس عرض صفحه:
    /// - اگر عرض صفحه بیشتر از 1200 پیکسل باشد، حاشیه 18% عرض صفحه خواهد بود.
    /// - در غیر این صورت، حاشیه پیش‌فرض (20 پیکسل) استفاده می‌شود.
    final horizontalPadding = screenWidth > 1200 ? screenWidth * 0.18 : 20.0;

    return Scaffold(
      body: Scrollbar(
        controller: scrollController,
        thumbVisibility:
            Responsive.isDesktop(context), // نمایش شست اسکرول در صفحات دسکتاپ.
        trackVisibility:
            Responsive.isDesktop(context), // نمایش مسیر اسکرول در صفحات دسکتاپ.
        thickness: 10, // ضخامت شست اسکرول.
        radius: const Radius.circular(10), // شعاع گردی شست و مسیر اسکرول.
        child: Stack(
          alignment:
              Alignment.topCenter, // هم‌ترازی المان‌ها در مرکز بالای صفحه.
          children: [
            CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: TweenAnimationBuilder<EdgeInsets>(
                    duration:
                        const Duration(milliseconds: 500), // مدت زمان انیمیشن.
                    tween: Tween<EdgeInsets>(
                      end: EdgeInsets.only(
                        top: 100,
                        left: horizontalPadding,
                        right: horizontalPadding,
                        bottom: 120,
                      ),
                    ),
                    builder: (context, padding, child) {
                      return Padding(
                        padding: padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // هم‌ترازی المان‌ها از سمت چپ.
                          children: [
                            ImageDetail(
                                imageUrl: widget
                                    .project.image!), // نمایش تصویر پروژه.
                            const SizedBox(
                                height: 16), // فاصله عمودی بین تصویر و عنوان.
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // هم‌ترازی بین عنوان و دکمه.
                              children: [
                                TextTitle(
                                    title: widget
                                        .project.title!), // نمایش عنوان پروژه.
                                SizedBox(
                                  height: 45,
                                  width: 160,
                                  child: CustomButton(
                                    onTap: () async {
                                      if (widget.project.gitHubLink != null) {
                                        // باز کردن لینک GitHub در صورت وجود.
                                        await urlLauncher.openUrl(
                                            widget.project.gitHubLink!);
                                      }
                                    },
                                    color: MyAppThemeConfig.of(context)
                                        .blue, // رنگ دکمه.
                                    icon: FontAwesomeIcons
                                        .github, // آیکون GitHub.
                                    text: "View on GitHub", // متن دکمه.
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                                height: 16), // فاصله عمودی بین عنوان و تگ‌ها.
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TagProject(
                                  tag: widget
                                      .project.tag!), // نمایش تگ‌های پروژه.
                            ),
                            const SizedBox(
                                height: 24), // فاصله عمودی بین تگ‌ها و توضیحات.
                            DescriptionWidget(
                                description: widget.project
                                    .description!), // نمایش توضیحات پروژه.
                          ],
                        )
                            .animate() // اضافه کردن انیمیشن به المان‌ها.
                            .slideY(
                                begin: 0.2,
                                end: 0,
                                curve: Curves.easeOut) // انیمیشن حرکت عمودی.
                            .fadeIn(), // انیمیشن ظهور تدریجی.
                      );
                    },
                  ),
                ),
              ],
            ),
            const Positioned(
              top: 20,
              child: CustomCloseButton(), // دکمه بستن در بالای صفحه.
            ),
          ],
        ),
      ),
    );
  }
}
