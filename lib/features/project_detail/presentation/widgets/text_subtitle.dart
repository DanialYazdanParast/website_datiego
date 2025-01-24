import 'package:flutter/material.dart';

class TextSubtitle extends StatelessWidget {
  const TextSubtitle({
    super.key,
    required this.subtitle,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
        color: Color(0xff6e6e6e),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
