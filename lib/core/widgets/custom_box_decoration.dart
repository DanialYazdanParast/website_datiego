import 'package:flutter/material.dart';
import 'package:website_datiego/core/constants/app_colors.dart';
import 'package:website_datiego/core/widgets/custom_border.dart';

BoxDecoration get customBoxDecoration {
  return BoxDecoration(
      color: LightThemeColors.secondaryColor, // معادل background-color
      borderRadius: BorderRadius.circular(32),
      border: customBorder);
}
