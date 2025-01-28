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
      decoration: customBoxDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "Hey again  ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextTitelAbout(
            text: "Hey again ",
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "I am currently on my professional journey, creating digital experiences that are both efficient and engaging. My goal is to improve and simplify technology to help people make their daily tasks easier and more enjoyable.",
            style: TextStyle(
                color: LightThemeColors.textSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.6),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(children: [
            Container(
              decoration: BoxDecoration(
                color:
                    LightThemeColors.onsecondaryColor, // معادل background-color
                borderRadius: BorderRadius.circular(8), // معادل border-radius
                border: customBorder,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12), // اگر نیاز به فاصله داخلی باشد
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: LightThemeColors.textSecondary,
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Shiraz, Iran", // محتوا
                      style: TextStyle(
                          color: LightThemeColors.textSecondary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600), // استایل متن
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
