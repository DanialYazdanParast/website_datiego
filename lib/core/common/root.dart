import 'package:flutter/material.dart';
import 'package:website_datiego/core/common/bottom_navigattion.dart';
import 'package:website_datiego/features/home/presentation/screens/home_screen.dart';

const int homeindex = 0;
const int projectsindex = 1;
const int blogindex = 2;
const int aboutindex = 3;

class RootScreen extends StatefulWidget {
  const RootScreen({
    super.key,
  });

  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedScreenIndex = homeindex;
  final List<int> _history = [];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _projectsKey = GlobalKey();
  final GlobalKey<NavigatorState> _bloghKey = GlobalKey();
  final GlobalKey<NavigatorState> _aboutKey = GlobalKey();

  late final map = {
    homeindex: _homeKey,
    projectsindex: _projectsKey,
    blogindex: _bloghKey,
    aboutindex: _aboutKey,
  };

  Future<bool> _onWillpop() async {
    final NavigatorState curentSelectedNavigatorState =
        map[selectedScreenIndex]!.currentState!;

    if (curentSelectedNavigatorState.canPop()) {
      curentSelectedNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillpop,
        child: Scaffold(
          key: RootScreen.scaffoldKey,
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              IndexedStack(
                index: selectedScreenIndex,
                children: [
                  _navigator(_homeKey, homeindex, const HomeScreen()),
                  _navigator(_projectsKey, projectsindex, const HomeScreen()),
                  _navigator(_bloghKey, blogindex, const HomeScreen()),
                  _navigator(_aboutKey, aboutindex, const HomeScreen()),
                ],
              ),
              Positioned(
                bottom: 0,
                child: BottomNavigattion(
                  selextedIndex: selectedScreenIndex,
                  onTab: (selectedIndex) {
                    setState(() {
                      _history.remove(selectedScreenIndex);
                      _history.add(selectedScreenIndex);
                      selectedScreenIndex = selectedIndex;
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (
                context,
              ) =>
                  Offstage(
                      offstage: selectedScreenIndex != index, child: child),
            ),
          );
  }
}
