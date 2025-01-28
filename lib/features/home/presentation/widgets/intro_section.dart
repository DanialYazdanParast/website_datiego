import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_datiego/core/constants/app_colors.dart';
import 'package:website_datiego/core/constants/app_constants.dart';
import 'package:website_datiego/core/widgets/custom_border.dart';
import 'package:website_datiego/core/widgets/custom_box_shadow.dart';
import 'package:website_datiego/features/home/presentation/bloc/home_bloc.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) =>
          context.read<HomeBloc>().add(const SetMouseRegionEvent(true)),
      onExit: (_) =>
          context.read<HomeBloc>().add(const SetMouseRegionEvent(false)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            height: 235,
            width: 435,
            decoration: BoxDecoration(
                color: LightThemeColors.onprimaryColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: customBoxShadow,
                border: customBorder),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildIntroRow('Hi, I\'m', 'Datiego', AppColors.lightPurple),
                  _buildIntroRow(
                      'I\'m a', 'Flutter Developer', AppColors.lightBlue),
                  InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(DownloadFileEvent(
                          url: AppConstants.urlCv,
                          fileName: "Danial-YazdanParast_Flutter.pdf"));
                    },
                    child: _buildIntroRow(
                        'my cv', 'Download ↗', AppColors.lightMintGreen),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 1000.ms, curve: Curves.easeIn)
        .moveY(begin: 50, end: 0, duration: 800.ms, curve: Curves.easeOut);
  }

  Widget _buildIntroRow(String label, String highlight, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w400)),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(highlight,
              style:
                  const TextStyle(fontSize: 36, fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
