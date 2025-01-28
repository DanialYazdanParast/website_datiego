import 'package:flutter/widgets.dart';

List<BoxShadow> get customBoxShadow {
  return [
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04),
      blurRadius: 4,
      offset: Offset(0, 0),
    ),
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04),
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04),
      blurRadius: 32,
      offset: Offset(0, 8),
    ),
  ];
}
