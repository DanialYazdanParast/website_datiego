import 'package:datiego/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:datiego/core/widgets/custom_box_decoration.dart';
import 'package:datiego/features/about_me/presentation/widgets/text_titel_about.dart';

class LittleBitAboutMe extends StatelessWidget {
  const LittleBitAboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: customBoxDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTitelAbout(
            text: "A little bit about me",
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            AppConstants.littleBitAboutMe,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
