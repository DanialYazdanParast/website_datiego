import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_datiego/core/di/service_locator.dart';
import 'package:website_datiego/features/home/presentation/bloc/home_bloc.dart';
import 'package:website_datiego/features/home/presentation/widgets/build_item_cards.dart';
import 'package:website_datiego/features/home/presentation/widgets/intro_section.dart';

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

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFD6E8), // Light pink
            Color(0xFFE3E8FF), // Light blue
            Color(0xFFCFF0D6), // Light green
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
                    const IntroSection(),
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
