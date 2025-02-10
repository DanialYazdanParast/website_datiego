import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:datiego/core/common/bottom_navigattion.dart';

import 'package:datiego/core/router/go_router.dart';

enum TabItem { home, projects, blog, about }

const Map<TabItem, String> tabRoutes = {
  TabItem.home: ScreenGoRouter.home,
  TabItem.projects: ScreenGoRouter.projects,
  TabItem.blog: ScreenGoRouter.blog,
  TabItem.about: ScreenGoRouter.about,
};

class RootScreen extends StatefulWidget {
  final Widget child;

  const RootScreen({super.key, required this.child});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  TabItem _selectedTab = TabItem.home;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateSelectedTab();
  }

  void _updateSelectedTab() {
    final GoRouterState state = GoRouterState.of(context);
    final String location = state.uri.toString();

    setState(() {
      if (location == tabRoutes[TabItem.home]) {
        _selectedTab = TabItem.home;
      } else if (location.startsWith(tabRoutes[TabItem.projects]!)) {
        _selectedTab = TabItem.projects;
      } else if (location.startsWith(tabRoutes[TabItem.blog]!)) {
        _selectedTab = TabItem.blog;
      } else if (location.startsWith(tabRoutes[TabItem.about]!)) {
        _selectedTab = TabItem.about;
      }
    });
  }

  void _onTabSelected(TabItem tabItem) {
    context.go(tabRoutes[tabItem]!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned.fill(
            child: widget.child, // Current page content
          ),
          Positioned(
            bottom: 0,
            child: BottomNavigattion(
              selextedIndex: _selectedTab.index,
              onTab: (index) {
                _onTabSelected(TabItem.values[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
