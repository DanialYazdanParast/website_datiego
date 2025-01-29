import 'package:flutter/material.dart';
import 'package:website_datiego/core/constants/app_colors.dart';
import 'package:website_datiego/core/widgets/custom_border.dart';
import 'package:website_datiego/core/widgets/custom_box_decoration.dart';
import 'package:website_datiego/features/about_me/presentation/widgets/text_titel_about.dart';

class ProfileIntroWidget extends StatelessWidget {
  const ProfileIntroWidget({
    super.key,
    required this.screenheight,
  });

  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenheight * 0.95,
      padding: const EdgeInsets.all(24),
      decoration: customBoxDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/aaaa.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const TextTitelAbout(
                text: "Hey again ",
              ),
              Image.asset(
                'assets/waving-hand.png',
                height: 26,
                width: 26,
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "I am currently on my professional journey, creating digital experiences that are both efficient and engaging. My goal is to improve and simplify technology to help people make their daily tasks easier and more enjoyable.",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .onSecondary, // معادل background-color
                borderRadius: BorderRadius.circular(8), // معادل border-radius
                border: customBorder(context),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12), // اگر نیاز به فاصله داخلی باشد
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: LightThemeColors.textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Shiraz, Iran", // محتوا
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14), // استایل متن
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
