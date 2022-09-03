import 'package:demo/Dashboard/menu.dart';
import 'package:demo/Dashboard/page_structure.dart';


import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static List<MenuClass> mainMenu = [
    MenuClass("Wellbeing index", Icons.payment, 0),
    MenuClass("Dominant Emotion", Icons.card_giftcard, 1),
    MenuClass("Habits", Icons.notifications, 2),
    MenuClass("Progress", Icons.help, 3),
    MenuClass("Accomplishment", Icons.info_outline, 4),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen: MenuScreen(
        HomeScreen.mainMenu,
        callback: _updatePage,
        current: 0,
      ),
      mainScreen: MainScreen(),
      borderRadius: 24.0,
      showShadow: true,
      //angle: -12.0,
      angle: 0.0,
      // menuBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      menuBackgroundColor: Colors.grey.shade300,
      mainScreenTapClose: true,
      drawerShadowsBackgroundColor: Colors.white,
      mainScreenAbsorbPointer: true,
      // mainScreenOverlayColor: Colors.blue.shade50,
      // slideWidth: MediaQuery.of(context).size.width * 0.70,
      menuScreenWidth: double.infinity,
      //  menuScreenHeight: double.infinity,

      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,

    );
    return ZoomDrawer(
      controller: _drawerController,
      menuScreen: MenuScreen(
        HomeScreen.mainMenu,
        callback: _updatePage,
        current: 0,
      ),
      mainScreen: MainScreen(),
      openCurve: Curves.fastOutSlowIn,
      showShadow: false,
      slideWidth: MediaQuery.of(context).size.width*  0.65,
      mainScreenTapClose: true,
      mainScreenOverlayColor: Colors.white.withOpacity(0.5),
      menuBackgroundColor: Colors.grey.shade300,
      drawerShadowsBackgroundColor: Colors.black,
      mainScreenAbsorbPointer: true,
      borderRadius: 10,
      angle: 0.0,
      menuScreenWidth: double.infinity,
      moveMenuScreen: false,
      style: DrawerStyle.defaultStyle,


    );
  }

  void _updatePage(int index) {
    context.read<MenuProvider>().updateCurrentPage(index);
    _drawerController.toggle?.call();
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context)!.stateNotifier,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: GestureDetector(
        child: const PageStructure(),
        onPanUpdate: (details) {
          if (details.delta.dx < 6 ) {
            ZoomDrawer.of(context)?.toggle.call();
          }
        },
      ),
    );
  }
}

class MenuProvider extends ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void updateCurrentPage(int index) {
    if (index == currentPage) return;
    _currentPage = index;
    print("_currentPage-->$_currentPage");

    notifyListeners();
  }
}