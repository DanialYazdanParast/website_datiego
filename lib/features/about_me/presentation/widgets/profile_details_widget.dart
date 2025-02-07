import 'package:flutter/material.dart';
import 'package:Datiego/features/about_me/presentation/widgets/little_bit_about_me.dart';
import 'package:Datiego/features/about_me/presentation/widgets/skills.dart';
import 'package:Datiego/features/about_me/presentation/widgets/social_media.dart';

class ProfileDetailsWidget extends StatelessWidget {
  const ProfileDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LittleBitAboutMe(),
        const SizedBox(height: 24),
        Skills(),
        const SizedBox(height: 24),
        const SocialMedia(),
      ],
    );
  }
}
