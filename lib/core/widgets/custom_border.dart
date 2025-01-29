import 'package:flutter/material.dart';

Border customBorder(BuildContext context) {
  return Border.all(
    color: Theme.of(context).colorScheme.outline,
    width: 1, // معادل border-width
    style: BorderStyle.solid, // معادل border-style
  );
}
