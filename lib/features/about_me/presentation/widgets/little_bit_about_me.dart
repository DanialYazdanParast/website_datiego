import 'package:flutter/material.dart';
import 'package:Datiego/core/widgets/custom_box_decoration.dart';
import 'package:Datiego/features/about_me/presentation/widgets/text_titel_about.dart';

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
            "I'm Danial Yazdan Parast. From a young age, I immersed myself in the world of the internet, starting with designing websites, creating blogs, and even building chatrooms. At 18, I entered university to study engineering and began learning programming in languages like C++, Python, Java, and PHP. However, I’ve been passionate about Flutter for over a year now, and my current focus is on mastering this framework. Although I don’t consider myself a professional developer yet, I’m constantly learning and growing in this field.\n\nOutside of programming, I have a strong passion for football and nature exploration, which helps me refresh my mind and recharge my energy alongside my work.",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
