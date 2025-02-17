import 'package:datiego/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomScrollbar extends StatelessWidget {
  final Widget child;
  final ScrollController controller;
  const CustomScrollbar(
      {super.key, required this.child, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        controller: controller,
        thumbVisibility:
            Responsive.isDesktop(context), // نمایش شست اسکرول در صفحات دسکتاپ.
        trackVisibility:
            Responsive.isDesktop(context), // نمایش مسیر اسکرول در صفحات دسکتاپ.
        thickness: Responsive.isDesktop(context) ? 10 : 7, // ضخامت شست اسکرول.
        radius: const Radius.circular(10),
        child: child);
  }
}
