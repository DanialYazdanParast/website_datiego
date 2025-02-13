import 'package:datiego/confing/theme/app_theme.dart';
import 'package:datiego/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';

import 'package:datiego/core/constants/app_constants.dart';
import 'package:datiego/core/services/url_launcher_service.dart';
import 'package:datiego/core/widgets/custom_border.dart';
import 'package:datiego/features/about_me/presentation/widgets/text_titel_about.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final urlLauncher = GetIt.instance<UrlLauncherService>();
    final themeConfig = MyAppThemeConfig.of(context);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(32),
        border: customBorder(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTitelAbout(
            text: "Come and say hi! ",
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              CustomButton(
                onTap: () async {
                  await urlLauncher.sendEmail('danialyazdan77@gmail.com');
                },
                color: themeConfig.green,
                icon: Icons.email_outlined,
                text: "danialyazdan77@gmail.com",
              ),
              const SizedBox(height: 10),
              CustomButton(
                onTap: () async {
                  await urlLauncher.openUrl(AppConstants.gitHubUrl);
                },
                color: themeConfig.gray,
                icon: FontAwesomeIcons.github,
                text: "github.com/DanialYazdanParast",
              ),
              const SizedBox(height: 10),
              CustomButton(
                onTap: () async {
                  await urlLauncher.openUrl(AppConstants.linkedinUrl);
                },
                color: themeConfig.skyBlue,
                icon: FontAwesomeIcons.linkedin,
                text: "linkedin.com/DanialYazdanParast",
              ),
              const SizedBox(height: 10),
              CustomButton(
                onTap: () async {
                  await urlLauncher.openUrl(AppConstants.instagramUrl);
                },
                color: themeConfig.pink,
                icon: FontAwesomeIcons.instagram,
                text: "instagram.com/datiego",
              ),
              const SizedBox(height: 10),
              CustomButton(
                onTap: () async {
                  await urlLauncher.makePhoneCall(AppConstants.phoneNumbercall);
                },
                color: themeConfig.peach,
                icon: Icons.phone_outlined,
                text: AppConstants.phoneNumber,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
