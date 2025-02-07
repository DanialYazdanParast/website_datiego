import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Datiego/core/di/service_locator.dart';
import 'package:Datiego/features/home/presentation/bloc/home_bloc.dart';
import 'package:Datiego/features/home/presentation/widgets/build_item_cards.dart';
import 'package:Datiego/features/home/presentation/widgets/intro_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            HomeBloc(getIt.get(), getIt.get())..add(GetProjectsHomeEvent()),
        child: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode
              ? [
                  const Color(0x4a3E3B4F), // Soft dark purple
                  const Color(0x4a4A4A6A), // Soft dark blue
                  const Color(0x4a3D5A6C), // Soft dark teal
                ]
              : [
                  const Color(0xFFFFD6E8), // Light pink
                  const Color(0xFFE3E8FF), // Light blue
                  const Color(0xFFCFF0D6), // Light green
                ],
        ),
      ),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final showItemCard = (state is HomeSuccesState) &&
              (state.mouseRegion || state.hoveredOnItemCard) &&
              width > 800 &&
              height > 600;

          return Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    const SizedBox.expand(),
                    if (showItemCard)
                      buildItemCards(
                        state,
                        width,
                        height,
                      ),
                    (width >= 600)
                        ? const IntroSection(
                            fontSize: 36,
                            height: 235,
                            width: 435,
                            sizeimage: 50,
                          )
                        : const IntroSection(
                            fontSize: 24,
                            height: 178,
                            width: 290,
                            sizeimage: 30,
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
            ],
          );
        },
      ),
    );
  }
}
