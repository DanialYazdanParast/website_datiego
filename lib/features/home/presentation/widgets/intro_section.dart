import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Datiego/core/constants/app_colors.dart';
import 'package:Datiego/core/constants/app_constants.dart';
import 'package:Datiego/core/widgets/custom_border.dart';
import 'package:Datiego/core/widgets/custom_box_shadow.dart';
import 'package:Datiego/features/home/presentation/bloc/home_bloc.dart';

class IntroSection extends StatelessWidget {
  const IntroSection(
      {super.key,
      required this.height,
      required this.width,
      required this.fontSize,
      required this.sizeimage});
  final double height;
  final double width;
  final double fontSize;
  final double sizeimage;

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
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(24),
                boxShadow: customBoxShadow,
                border: customBorder(context)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildIntroRow('Hi, I\'m', 'Datiego', AppColors.lightPurple,
                      context, true, fontSize, sizeimage),
                  _buildIntroRow('I\'m a', 'Flutter Developer',
                      AppColors.lightBlue, context, false, fontSize, sizeimage),
                  InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(DownloadFileEvent(
                          url: AppConstants.urlCv,
                          fileName: "Danial-YazdanParast_Flutter.pdf"));
                    },
                    child: _buildIntroRow(
                        'my cv',
                        'Download ↗',
                        AppColors.lightMintGreen,
                        context,
                        false,
                        fontSize,
                        sizeimage),
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

  Widget _buildIntroRow(String label, String highlight, Color color,
      BuildContext context, bool image, double fontSize, double sizeimage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: fontSize, fontWeight: FontWeight.w400)),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Text(highlight,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                      height: 1.1)),
              image
                  ? Image.asset(
                      'assets/co.png',
                      height: sizeimage,
                      fit: BoxFit.cover,
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
