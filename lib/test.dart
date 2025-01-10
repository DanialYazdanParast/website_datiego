import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SkillsAnimation extends StatefulWidget {
  const SkillsAnimation({super.key});

  @override
  _SkillsAnimationState createState() => _SkillsAnimationState();
}

class _SkillsAnimationState extends State<SkillsAnimation> {
  final Random random = Random();

  late List<Offset> positions;

  @override
  void initState() {
    super.initState();

    positions = [
      const Offset(50, 50),
      const Offset(200, 70),
      const Offset(100, 150),
      const Offset(50, 250),
      const Offset(180, 200),
      const Offset(280, 120),
    ];

    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        positions = positions.map((pos) {
          double dx =
              pos.dx + random.nextInt(40) - 20; // تغییرات کوچک‌تر در محور X
          double dy =
              pos.dy + random.nextInt(40) - 20; // تغییرات کوچک‌تر در محور Y

          dx = dx.clamp(0.0, MediaQuery.of(context).size.width - 100);
          dy = dy.clamp(0.0, MediaQuery.of(context).size.height - 100);

          return Offset(dx, dy);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 20,
          left: 20,
          child: Text(
            "Skills",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        ...List.generate(positions.length, (index) {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 400), // زمان کوتاه‌تر
            curve: Curves.easeInOut, // منحنی روان‌تر
            top: positions[index].dy,
            left: positions[index].dx,
            child: Material(
              child: _buildTag(index),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildTag(int index) {
    final colors = [
      Colors.orange,
      Colors.blue,
      Colors.green,
      Colors.red,
      Colors.pink,
      Colors.purple,
    ];

    final skills = [
      "UX DESIGN",
      "BRANDING",
      "WEB DESIGN",
      "STRATEGY",
      "USER RESEARCH",
      "FRAMER",
    ];

    return Chip(
      label: Text(
        skills[index],
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: colors[index],
      elevation: 4,
    );
  }
}
