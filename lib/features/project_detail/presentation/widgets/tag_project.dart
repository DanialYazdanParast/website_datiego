import 'package:flutter/material.dart';

class TagProject extends StatelessWidget {
  const TagProject({
    super.key,
    required this.tag,
  });

  final List<String> tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: tag.map((tag) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color.fromRGBO(0, 0, 0, 0.1),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Color(0xff6e6e6e),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }
}
