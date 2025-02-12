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
            "I'm Danial Yazdan Parast, a Flutter Developer with a deep passion for creating engaging and user-friendly digital experiences. From a young age, I became fascinated with technology and started my journey by designing websites, creating blogs, and building chatrooms. As I entered university and pursued an engineering degree, I expanded my programming skills in languages such as C++, Python, Java, and PHP. Over the past year, I have focused on mastering the Flutter framework and have implemented several projects using this technology. Although I am still at the beginning of my professional journey, I am continuously learning and growing in this field with great enthusiasm.\n\nBeyond programming, I have a strong interest in trading in financial markets, which enhances my analytical and decision-making skills. I am also passionate about football and exploring nature, as I believe these activities help refresh my mind and inspire more creative ideas. ",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
