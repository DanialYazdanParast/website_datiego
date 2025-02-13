import 'package:flutter/material.dart';

/// یک ویجت دکمه سفارشی که شامل متن، آیکون و قابلیت تغییر رنگ هنگام Hover است.
///
/// این دکمه از `TextButton.icon` استفاده می‌کند و می‌تواند برای ایجاد دکمه‌های زیبا و تعاملی استفاده شود.
///
/// پارامترها:
/// - [text]: متن نمایش داده شده روی دکمه.
/// - [color]: رنگ دکمه هنگام Hover.
/// - [icon]: آیکون نمایش داده شده در کنار متن.
/// - [onTap]: تابعی که هنگام کلیک روی دکمه اجرا می‌شود.
///
/// مثال استفاده:
/// ```dart
/// CustomButton(
///   text: 'ثبت نام',
///   color: Colors.blue,
///   icon: Icons.person_add,
///   onTap: () {
///     print('دکمه کلیک شد!');
///   },
/// );
/// ```

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 53),
        side: const BorderSide(
          width: 1,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      ).copyWith(
        // تغییر رنگ هنگام Hover
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return color; // رنگ هنگام Hover
            }
            return Theme.of(context).colorScheme.onSecondary; // رنگ پیش‌فرض
          },
        ),
      ),
      label: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
      ),
      onPressed: onTap, // تابع اجرا شده هنگام کلیک
      icon: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: 24,
      ),
    );
  }
}
