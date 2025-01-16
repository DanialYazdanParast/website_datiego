import 'package:flutter/material.dart';

Widget buildProjectList({
  required ScrollController controller,
  required double screenWidth,
  required int itemCount,
  required Widget Function(BuildContext, int) itemBuilder,
}) {
  return CustomScrollView(
    controller: controller,
    slivers: <Widget>[
      const SliverPadding(padding: EdgeInsets.only(top: 30)),
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth <= 900 ? 1 : 2,
            crossAxisSpacing: 32,
            mainAxisSpacing: 32,
            childAspectRatio: 0.9 / 1,
          ),
          delegate: SliverChildBuilderDelegate(
            itemBuilder,
            childCount: itemCount,
          ),
        ),
      ),
      const SliverPadding(padding: EdgeInsets.only(top: 120)),
    ],
  );
}
