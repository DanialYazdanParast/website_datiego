import 'package:flutter/material.dart';

class BlogButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const BlogButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(130, 53),
        backgroundColor: const Color(0xFFEEEEEE),
        side: const BorderSide(
          width: 1,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      ).copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return color;
            }
            return Theme.of(context).colorScheme.onSecondary;
          },
        ),
      ),
      label: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
      ),
      onPressed: onTap,
    );
  }
}
