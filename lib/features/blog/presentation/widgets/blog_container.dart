import 'package:datiego/core/widgets/custom_border.dart';
import 'package:flutter/material.dart';

/// یک ویجت کانتینر سفارشی که از رنگ و حاشیه‌های ویژه برای طراحی استفاده می‌کند.
///
/// این ویجت به شما امکان می‌دهد تا محتوای خود را در یک کانتینر با طراحی دلخواه
/// قرار دهید. این کانتینر دارای حاشیه گرد و رنگ پس‌زمینه از نوع `secondary` است.
/// شما می‌توانید هر ویجت دلخواهی را به عنوان فرزند (child) به آن ارسال کنید.
///
/// ## پارامترها:
/// - `child`: ویجت فرزند که داخل کانتینر نمایش داده می‌شود.
///
/// ## مثال استفاده:
/// ```dart
/// BlogContainer(
///   child: Text("محتوای وبلاگ"),
/// )
/// ```
///
/// ## نکات:
/// - این ویجت دارای حاشیه گرد (با شعاع ۳۲) و رنگ پس‌زمینه متناسب با تم فعلی است.
class BlogContainer extends StatelessWidget {
  /// ویجت فرزند که داخل کانتینر نمایش داده می‌شود
  final Widget child;

  /// سازنده که ویجت فرزند را دریافت می‌کند
  const BlogContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // طراحی کانتینر با رنگ پس‌زمینه و حاشیه‌های گرد
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary, // رنگ پس‌زمینه از تم
        borderRadius: BorderRadius.circular(32), // شعاع گرد شدن حاشیه‌ها
        border: customBorder(context), // حاشیه سفارشی
      ),
      child: child, // ویجت فرزند که داخل کانتینر قرار می‌گیرد
    );
  }
}
