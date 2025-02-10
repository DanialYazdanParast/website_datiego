import 'package:datiego/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:datiego/core/common/bottom_navigation_item.dart';
import 'package:datiego/core/common/root.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:datiego/core/constants/app_colors.dart';
import 'package:datiego/core/constants/app_constants.dart';

import 'package:datiego/core/services/url_launcher_service.dart';
import 'package:datiego/core/widgets/custom_border.dart';
import 'package:datiego/core/widgets/custom_box_shadow.dart';

class BottomNavigattion extends StatelessWidget {
  final Function(int index) onTab;
  final int selextedIndex;
  const BottomNavigattion(
      {super.key, required this.onTab, required this.selextedIndex});

  @override
  Widget build(BuildContext context) {
    final urlLauncher = GetIt.instance<UrlLauncherService>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(24),
          boxShadow: customBoxShadow,
          border: customBorder(context),
        ),
        child: Container(
          color: Colors.transparent,
          padding:
              const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomNavigationItem(
                label: 'Home',
                iconFileName: Icons.home_outlined,
                isActive: selextedIndex == TabItem.home.index,
                color: AppColors.lightPeach,
                onTap: () {
                  onTab(TabItem.home.index);
                },
              ),
              const SizedBox(width: 12),
              BottomNavigationItem(
                label: 'Projects',
                iconFileName: Icons.code,
                isActive: selextedIndex == TabItem.projects.index,
                color: AppColors.lightPurple,
                onTap: () {
                  onTab(TabItem.projects.index);
                },
              ),
              const SizedBox(width: 12),
              BottomNavigationItem(
                label: 'Blog',
                iconFileName: Icons.article_outlined,
                isActive: selextedIndex == TabItem.blog.index,
                color: AppColors.lightCoral,
                onTap: () {
                  onTab(TabItem.blog.index);
                },
              ),
              const SizedBox(width: 12),
              BottomNavigationItem(
                label: 'About Me',
                iconFileName: Icons.account_circle_outlined,
                isActive: selextedIndex == TabItem.about.index,
                color: AppColors.lightBlue,
                onTap: () {
                  onTab(TabItem.about.index);
                },
              ),
              const SizedBox(width: 12),
              Container(
                width: 2,
                height: 20,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 12),
              BottomNavigationItem(
                label: 'danialyazdan77@gmail.com ↗',
                iconFileName: Icons.email_outlined,
                color: AppColors.lightMintGreen,
                isActive: false,
                onTap: () async {
                  await urlLauncher.sendEmail(AppConstants.emailUrl);
                },
              ),
              if (Responsive.isDesktop(context))
                Row(
                  children: [
                    const SizedBox(width: 12),
                    BottomNavigationItem(
                      label: '@DanialYazdanParast ↗',
                      iconFileName: FontAwesomeIcons.github,
                      color: AppColors.gray400,
                      isActive: false,
                      onTap: () async {
                        await urlLauncher.openUrl(AppConstants.gitHubUrl);
                      },
                    ),
                    const SizedBox(width: 12),
                    BottomNavigationItem(
                      label: '@DanialYazdanParast ↗',
                      iconFileName: FontAwesomeIcons.linkedin,
                      color: AppColors.lightSkyBlue,
                      isActive: false,
                      onTap: () async {
                        await urlLauncher.openUrl(AppConstants.linkedinUrl);
                      },
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
