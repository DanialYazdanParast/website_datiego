import 'package:flutter/material.dart';
import 'package:datiego/core/widgets/custom_border.dart';

BoxDecoration customBoxDecoration(BuildContext context) {
  return BoxDecoration(
      color: Theme.of(context).colorScheme.secondary, // معادل background-color
      borderRadius: BorderRadius.circular(32),
      border: customBorder(context));
}
