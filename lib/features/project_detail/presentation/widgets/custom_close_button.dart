import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:website_datiego/core/constants/app_colors.dart';
import 'package:website_datiego/core/widgets/custom_border.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Container(
        height: 48,
        width: 48,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: LightThemeColors.onprimaryColor, // معادل background-color
            borderRadius: BorderRadius.circular(12),
            border: customBorder),
        child: const Icon(
          Icons.close,
          size: 25,
        ),
      ),
    );
  }
}
