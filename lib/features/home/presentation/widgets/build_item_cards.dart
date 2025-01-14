import 'package:flutter/material.dart';
import 'package:website_datiego/features/home/presentation/bloc/home_bloc.dart';
import 'package:website_datiego/features/home/presentation/widgets/item_card_home.dart';

Widget buildItemCards(HomeState state, double width, double height) {
  if (state is HomeSuccesState) {
    return Positioned(
      child: SizedBox(
        height: 600,
        width: 800,
        child: Stack(
          children: state.projects.take(6).map((project) {
            final index = state.projects.indexOf(project);
            return ItemCardHome(
              imageUrl: project.image!,
              width: width,
              height: height,
              alignmentx: _getAlignmentX(index),
              alignmenty: _getAlignmentY(index),
              angle: _getAngle(index),
            );
          }).toList(),
        ),
      ),
    );
  }
  return const SizedBox.shrink();
}

double _getAlignmentX(int index) {
  const alignmentX = [0.55, -0.95, 0.05, 0.99, -0.7];
  return alignmentX[index % alignmentX.length];
}

double _getAlignmentY(int index) {
  const alignmentY = [-0.82, 0.60, 0.85, 0.5, -0.70];
  return alignmentY[index % alignmentY.length];
}

double _getAngle(int index) {
  const angles = [0.06, 0.05, -0.05, 0.08, -0.08];
  return angles[index % angles.length];
}
