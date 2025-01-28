import 'package:flutter/material.dart';
import 'package:website_datiego/core/constants/app_colors.dart';
import 'package:website_datiego/core/widgets/custom_border.dart';
import 'package:website_datiego/core/widgets/custom_box_decoration.dart';
import 'package:website_datiego/features/about_me/presentation/widgets/text_titel_about.dart';

class LittleBitAboutMe extends StatelessWidget {
  const LittleBitAboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: customBoxDecoration,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitelAbout(
            text: "A little bit about me",
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "I'm Danial Yazdan Parast. From a young age, I immersed myself in the world of the internet, starting with designing websites, creating blogs, and even building chatrooms. At 18, I entered university to study engineering and began learning programming in languages like C++, Python, Java, and PHP. However, I’ve been passionate about Flutter for over a year now, and my current focus is on mastering this framework. Although I don’t consider myself a professional developer yet, I’m constantly learning and growing in this field.\n\nOutside of programming, I have a strong passion for football and nature exploration, which helps me refresh my mind and recharge my energy alongside my work.",
            style: TextStyle(
              color: LightThemeColors.textSecondary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
