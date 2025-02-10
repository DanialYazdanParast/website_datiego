import 'package:datiego/core/utils/responsive.dart';
import 'package:datiego/features/about_me/presentation/widgets/about_me_desktop.dart';
import 'package:datiego/features/about_me/presentation/widgets/about_me_mobile.dart';
import 'package:flutter/material.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Responsive(
        desktop:
            AboutMeDesktop(scrollController: scrollController, width: width),
        mobile: AboutMeMobile(scrollController: scrollController, width: width),
      ),
    );
  }
}
