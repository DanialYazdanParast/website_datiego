import 'package:flutter/cupertino.dart';

Border get customBorder {
  return Border.all(
    color: const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
    width: 1, // معادل border-width
    style: BorderStyle.solid, // معادل border-style
  );
}
