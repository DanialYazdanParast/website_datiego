import 'package:datiego/core/constants/app_colors.dart';
import 'package:datiego/core/utils/responsive.dart';

import 'package:datiego/features/blog/domain/entities/blog_entities.dart';
import 'package:datiego/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_desktop.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_desktop_shimmer.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_mobile.dart';
import 'package:datiego/features/blog/presentation/widgets/blog_mobile_shimmer.dart';
import 'package:flutter/material.dart';

/// ویجت محتوای وبلاگ که با توجه به وضعیت دریافت داده، نمایش مناسب را انجام می‌دهد.
///
/// این ویجت با استفاده از وضعیت‌های مختلف وبلاگ (در حال بارگذاری، موفقیت، یا خطا)،
/// محتوای وبلاگ را به‌صورت واکنش‌گرا (برای موبایل و دسکتاپ) نمایش می‌دهد.
/// همچنین در هنگام بارگذاری داده‌ها، از شایمر برای نمایش پیش‌نمایش استفاده می‌شود.
///
/// ## پارامترها:
/// - `state`: وضعیت جاری وبلاگ که می‌تواند یکی از سه حالت زیر باشد:
///   - `BlogLoadingState`: در حال بارگذاری داده‌ها
///   - `BlogSuccesState`: داده‌ها دریافت شده‌اند
///   - `BlogErrorState`: خطا در دریافت داده‌ها
///
/// ## مثال استفاده:
/// ```dart
/// BlogContent(state: blogState)
/// ```
///
/// ## نکات:
/// - این ویجت از شایمر برای نشان دادن صفحه در حال بارگذاری استفاده می‌کند.
/// - برای دسکتاپ و موبایل از ویجت‌های جداگانه‌ای برای نمایش محتوا استفاده می‌شود.
class BlogContent extends StatelessWidget {
  /// وضعیت فعلی وبلاگ
  final BlogState state;

  /// سازنده ویجت `BlogContent`
  const BlogContent({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).colorScheme.brightness == Brightness.dark;

    // بررسی وضعیت و بازگشت ویجت مناسب برای هر وضعیت
    if (state is BlogLoadingState) {
      return _buildShimmerList(); // در حال بارگذاری
    } else if (state is BlogSuccesState) {
      return _buildBlogList(
          (state as BlogSuccesState).blogs, isDark); // در صورت موفقیت
    } else if (state is BlogErrorState) {
      return _buildErrorWidget(
          (state as BlogErrorState).exception.message); // در صورت خطا
    } else {
      throw Exception(
          'Error state not handled'); // خطا در صورت وجود وضعیت ناشناخته
    }
  }

  /// ویجتی برای نمایش خطای دریافت داده‌ها
  Widget _buildErrorWidget(String errorMessage) {
    return SliverToBoxAdapter(
        child: Center(
      child: Text(errorMessage), // نمایش پیام خطا
    ));
  }

  /// ویجتی برای نمایش شایمر در حال بارگذاری داده‌ها
  Widget _buildShimmerList() {
    return SliverList.builder(
      itemCount: 6, // تعداد شایمرها
      itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 32),
          child: Responsive(
            desktop: BlogDesktopShimmer(), // شایمر برای دسکتاپ
            mobile: BlogMobileShimmer(), // شایمر برای موبایل
          )),
    );
  }

  /// ویجتی برای نمایش لیست وبلاگ‌ها پس از دریافت داده‌ها
  Widget _buildBlogList(List<BlogEntities> blogs, bool isDark) {
    return SliverList.builder(
      itemCount: blogs.length, // تعداد وبلاگ‌ها
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Responsive(
            desktop: BlogDesktop(
              blog: blogs[index], // نمایش وبلاگ برای دسکتاپ
              blogColor: isDark
                  ? blogColorsDark[
                      index % blogColorsDark.length] // رنگ مناسب برای تم تاریک
                  : blogColorsLight[
                      index % blogColorsLight.length], // رنگ مناسب برای تم روشن
            ),
            mobile: BlogMobile(
              blog: blogs[index], // نمایش وبلاگ برای موبایل
              blogColor: isDark
                  ? blogColorsDark[index % blogColorsDark.length]
                  : blogColorsLight[index % blogColorsLight.length],
            ),
          )),
    );
  }
}
