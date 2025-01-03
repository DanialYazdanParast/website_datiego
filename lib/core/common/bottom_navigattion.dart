import 'package:flutter/material.dart';
import 'package:website_datiego/core/common/bottom_navigation_item.dart';
import 'package:website_datiego/core/common/root.dart';

class BottomNavigattion extends StatelessWidget {
  final Function(int index) onTab;
  final int selextedIndex;
  const BottomNavigattion(
      {super.key, required this.onTab, required this.selextedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(248, 248, 248, 0.84),
          borderRadius: BorderRadius.circular(24),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.04),
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.04),
              blurRadius: 16,
              offset: Offset(0, 4),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.04),
              blurRadius: 32,
              offset: Offset(0, 8),
            ),
          ],
          border: Border.all(
            color: const Color.fromRGBO(255, 255, 255, 0.84),
            width: 1,
          ),
        ),
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BottomNavigationItem(
                label: 'Home',
                iconFileName: Icons.home_outlined,
                isActive: selextedIndex == homeindex,
                color: const Color(0xfffac99c),
                onTap: () {
                  onTab(homeindex);
                },
              ),
              const SizedBox(width: 12),
              BottomNavigationItem(
                label: 'Projects',
                iconFileName: Icons.code,
                isActive: selextedIndex == projectsindex,
                color: const Color(0xffc8adfa),
                onTap: () {
                  onTab(projectsindex);
                },
              ),
              const SizedBox(width: 12),
              BottomNavigationItem(
                label: 'Blog',
                iconFileName: Icons.article_outlined,
                isActive: selextedIndex == blogindex,
                color: const Color(0xfff8a9a8),
                onTap: () {
                  onTab(blogindex);
                },
              ),
              const SizedBox(width: 12),
              BottomNavigationItem(
                label: 'About Me',
                iconFileName: Icons.account_circle_outlined,
                isActive: selextedIndex == aboutindex,
                color: const Color(0xff9ccbf5),
                onTap: () {
                  onTab(aboutindex);
                },
              ),
              const SizedBox(width: 12),
              Container(
                width: 2,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 12),
              BottomNavigationItem(
                label: 'danialyazdan77@gmail.com ↗',
                iconFileName: Icons.email_outlined,
                color: const Color(0xffb0e3b6),
                isActive: false,
                onTap: () {
                  onTab(homeindex);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
