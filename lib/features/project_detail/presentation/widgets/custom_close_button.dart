import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          color: const Color(0xFFf8f8f8)
              .withOpacity(0.8), // معادل background-color
          borderRadius: BorderRadius.circular(12),

          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
            width: 1, // معادل border-width
            style: BorderStyle.solid, // معادل border-style
          ),
        ),
        child: const Icon(
          Icons.close,
          size: 25,
        ),
      ),
    );
  }
}
