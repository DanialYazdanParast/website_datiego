import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            width: 434,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 248, 248, 0.84),
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.04), blurRadius: 4),
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.04), blurRadius: 16),
                BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.04), blurRadius: 32),
              ],
              border: Border.all(
                color: const Color.fromRGBO(255, 255, 255, 0.84),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildIntroRow(
                      'Hi, I\'m', 'Datiego', const Color(0xffc8adfa)),
                  _buildIntroRow(
                      'I\'m a', 'Flutter Developer', const Color(0xff9ccbf5)),
                  InkWell(
                    onTap: () {
                      context.read<HomeBloc>().add(const DownloadFileEvent(
                          url:
                              "https://rozup.ir/download/3973557/Danial-YazdanParast_Flutter.pdf",
                          fileName: "Danial-YazdanParast_Flutter.pdf"));
                    },
                    child: _buildIntroRow(
                        'my cv', 'Download ↗', const Color(0xffb0e3b6)),
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
