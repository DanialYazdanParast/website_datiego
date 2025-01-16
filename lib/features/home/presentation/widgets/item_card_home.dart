import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_datiego/core/widgets/image_loding_service.dart';
import 'package:website_datiego/features/home/presentation/bloc/home_bloc.dart';

class ItemCardHome extends StatelessWidget {
  const ItemCardHome({
    super.key,
    required this.width,
    required this.height,
    required this.alignmentx,
    required this.alignmenty,
    required this.angle,
    required this.imageUrl,
  });

  final double width;
  final double height;
  final double alignmentx;
  final double alignmenty;
  final double angle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(alignmentx, alignmenty),
      child: MouseRegion(
        onEnter: (_) =>
            context.read<HomeBloc>().add(const SetHoveredOnItemCardEvent(true)),
        onExit: (_) => context
            .read<HomeBloc>()
            .add(const SetHoveredOnItemCardEvent(false)),
        child: Transform.rotate(
          angle: angle,
          child: SizedBox(
            height: 170,
            width: 220,
            child: ImageLodingService(
              imageUrl: imageUrl,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    ).animate().fadeIn().scale();
  }
}
