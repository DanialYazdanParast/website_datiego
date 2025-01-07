import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool mouseRegion = false;
  bool hoveredOnItemCard = false;

  bool get showGreenBox => mouseRegion || hoveredOnItemCard;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFD6E8), // صورتی کمرنگ
              Color(0xFFE3E8FF), // آبی کمرنگ
              Color(0xFFCFF0D6), // سبز کمرنگ
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  if (showGreenBox && width > 800 && height > 600)
                    Positioned(
                      child: SizedBox(
                        height: 600,
                        width: 800,
                        child: Stack(
                          children: [
                            ItemCardHome(
                              width: width,
                              height: height,
                              color: Colors.red,
                              alignmentx: 0.55,
                              alignmenty: -0.92,
                              angle: 0.06,
                              onHover: _onItemCardHover,
                              onExit: _onItemCardExit,
                            ),
                            ItemCardHome(
                              width: width,
                              height: height,
                              color: Colors.black,
                              alignmentx: -0.9,
                              alignmenty: 0.70,
                              angle: 0.05,
                              onHover: _onItemCardHover,
                              onExit: _onItemCardExit,
                            ),
                            ItemCardHome(
                              width: width,
                              height: height,
                              color: Colors.blue,
                              alignmentx: 0.05,
                              alignmenty: 0.90,
                              angle: -0.05,
                              onHover: _onItemCardHover,
                              onExit: _onItemCardExit,
                            ),
                            ItemCardHome(
                              width: width,
                              height: height,
                              color: Colors.purpleAccent,
                              alignmentx: 0.95,
                              alignmenty: 0.5,
                              angle: 0.08,
                              onHover: _onItemCardHover,
                              onExit: _onItemCardExit,
                            ),
                            ItemCardHome(
                              width: width,
                              height: height,
                              color: Colors.greenAccent,
                              alignmentx: -0.7,
                              alignmenty: -0.80,
                              angle: -0.08,
                              onHover: _onItemCardHover,
                              onExit: _onItemCardExit,
                            ),
                          ],
                        ),
                      ),
                    ),
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        mouseRegion = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        mouseRegion = false;
                      });
                    },
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Hi, I\'m',
                                        style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w400)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffc8adfa),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Text('Datiego ',
                                          style: TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('I\'m a',
                                        style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w400)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: const Color(0xfffac99c),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Text('Flutter Developer',
                                          style: TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('my cv',
                                        style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.w400)),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          color: const Color(0xffb0e3b6),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: const Text('Download ↗',
                                          style: TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 1000.ms, curve: Curves.easeIn)
                        .moveY(
                            begin: 50,
                            end: 0,
                            duration: 800.ms,
                            curve: Curves.easeOut),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  void _onItemCardHover() {
    setState(() {
      hoveredOnItemCard = true;
    });
  }

  void _onItemCardExit() {
    setState(() {
      hoveredOnItemCard = false;
    });
  }
}

class ItemCardHome extends StatelessWidget {
  const ItemCardHome({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.alignmentx,
    required this.alignmenty,
    required this.angle,
    required this.onHover,
    required this.onExit,
  });

  final double width;
  final double height;
  final Color color;
  final double alignmentx;
  final double alignmenty;
  final double angle;
  final VoidCallback onHover;
  final VoidCallback onExit;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(alignmentx, alignmenty),
      child: MouseRegion(
        onEnter: (_) => onHover(),
        onExit: (_) => onExit(),
        child: Transform.rotate(
          angle: angle,
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
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
          ),
        ),
      ),
    ).animate().fadeIn().scale();
  }
}
