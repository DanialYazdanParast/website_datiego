import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:website_datiego/core/constants/app_colors.dart';
import 'package:website_datiego/core/constants/app_constants.dart';
import 'package:website_datiego/core/services/url_launcher_service.dart';
import 'package:website_datiego/features/about_me/presentation/widgets/text_titel_about.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final urlLauncher = GetIt.instance<UrlLauncherService>();
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFf8f8f8), // معادل background-color
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 0.1), // معادل border-color
          width: 1, // معادل border-width
          style: BorderStyle.solid, // معادل border-style
        ),
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
              ButtonSocial(
                onTap: () async {
                  await urlLauncher.sendEmail('danialyazdan77@gmail.com');
                },
                color: AppColors.lightMintGreen,
                icon: Icons.email_outlined,
                text: "danialyazdan77@gmail.com",
              ),
              const SizedBox(height: 10),
              ButtonSocial(
                onTap: () async {
                  await urlLauncher.openUrl(AppConstants.gitHubUrl);
                },
                color: AppColors.gray400,
                icon: FontAwesomeIcons.github,
                text: "github.com/DanialYazdanParast",
              ),
              const SizedBox(height: 10),
              ButtonSocial(
                onTap: () {},
                color: AppColors.lightSkyBlue,
                icon: FontAwesomeIcons.linkedin,
                text: "linkedin.com/DanialYazdanParast",
              ),
              const SizedBox(height: 10),
              ButtonSocial(
                onTap: () async {
                  await urlLauncher.openUrl(AppConstants.instagramUrl);
                },
                color: AppColors.lightPink,
                icon: FontAwesomeIcons.instagram,
                text: "instagram.com/Datiego",
              ),
              const SizedBox(height: 10),
              ButtonSocial(
                onTap: () {},
                color: AppColors.lightPeach,
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

class ButtonSocial extends StatelessWidget {
  const ButtonSocial({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final Color color;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 53),
        backgroundColor: const Color(0xFFEEEEEE),
        side: const BorderSide(
          width: 1,
          color: Color.fromRGBO(0, 0, 0, 0.1),
        ),
      ).copyWith(
        // تغییر رنگ هنگام Hover
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return color; // رنگ هنگام Hover
            }
            return LightThemeColors.onsecondaryColor; // رنگ پیش‌فرض
          },
        ),
      ),
      label:
          Text(text, style: const TextStyle(fontSize: 16, color: Colors.black)),
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
