import 'package:datiego/core/utils/responsive.dart';
import 'package:flutter/material.dart';

Widget buildProjectList(
    {required ScrollController controller,
    required double screenWidth,
    required int itemCount,
    required Widget Function(BuildContext, int) itemBuilder,
    required BuildContext context}) {
  return CustomScrollView(
    controller: controller,
    primary: false,
    slivers: <Widget>[
      const SliverPadding(padding: EdgeInsets.only(top: 30)),
      SliverPadding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isDesktop(context)
                  ? screenWidth * 0.08
                  : screenWidth * 0.05),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isDesktop(context) ? 2 : 1,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: Responsive.isDesktop(context) ? 0.9 : 0.8,
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
