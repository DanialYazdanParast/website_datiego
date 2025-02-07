import 'package:flutter/material.dart';
import 'package:Datiego/core/constants/app_constants.dart';

Widget buildProjectList({
  required ScrollController controller,
  required double screenWidth,
  required int itemCount,
  required Widget Function(BuildContext, int) itemBuilder,
}) {
  print(screenWidth);
  return CustomScrollView(
    controller: controller,
    primary: false,
    slivers: <Widget>[
      const SliverPadding(padding: EdgeInsets.only(top: 30)),
      SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth >= AppConstants.maxWidthMobile
                  ? screenWidth * 0.08
                  : screenWidth * 0.05),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth > AppConstants.maxWidthMobile ? 2 : 1,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio:
                  screenWidth >= AppConstants.maxWidthMobile ? 0.9 : 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
              itemBuilder,
              childCount: itemCount,
            ),
          )),
      const SliverPadding(padding: EdgeInsets.only(top: 120)),
    ],
  );
}
