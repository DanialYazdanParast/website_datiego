import 'package:flutter/material.dart';
import 'package:Datiego/core/widgets/custom_border.dart';

class TagProject extends StatelessWidget {
  const TagProject({
    super.key,
    required this.tag,
  });

  final List<String> tag;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: tag.map((tag) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(8),
                  border: customBorder(context)),
              child: Text(
                tag,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
              ),
            );
          }).toList() ??
          [],
    );
  }
}
