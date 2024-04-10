import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:myfitness_app/pages/dashboard.dart';
import 'package:pie_menu/pie_menu.dart';

List<Widget> _buildScreens() {
  return [ const HomePage(),
  const HomePage(),const HomePage(),const HomePage(),const HomePage(),
  ];
}


class NavBar_Screen extends StatefulWidget {
  const NavBar_Screen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<NavBar_Screen> createState() => _NavBar_ScreenState();
}

class _NavBar_ScreenState extends State<NavBar_Screen> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    return PieCanvas(
          theme: const PieTheme(
            delayDuration: Duration.zero,
            tooltipTextStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
            buttonTheme: PieButtonTheme(
              backgroundColor: Colors.deepOrange,
              iconColor: Colors.white,
            ),
            buttonThemeHovered: PieButtonTheme(
              backgroundColor: Colors.orangeAccent,
              iconColor: Colors.black,
            ),
            brightness: Brightness.dark,
          ),

          child: PersistentTabView(
            context,
            controller: controller,
            screens: _buildScreens(),
            items: _navBarsItems(context),
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              boxShadow: [BoxShadow(color: Colors.grey[300] as Color, spreadRadius: 0, blurRadius: 2)],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style17,
          ),
        );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_outlined),
      title: ("Home"),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.sports_martial_arts_outlined),
      title: ("Activities"),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: PieMenu(
        actions: [
          PieAction(
            tooltip: const Text('Add Activity'),
            onSelect: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add Activity'))),
            child: const Icon(Icons.directions_run),
          ),
          PieAction(
            tooltip: const Text('Add Meal'),
            onSelect: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add Meal'))),
            child: const Icon(Icons.fastfood),
          ),
          PieAction(
            tooltip: const Text('Add Water Intake'),
            onSelect: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add Water Intake'))),
            child: const Icon(Icons.local_drink),
          ),
        ],
        child: const Icon(Icons.add),
      ),
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.camera_alt_outlined),
      title: 'Scan Meal',
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.more_horiz_outlined),
      title: ("More"),
      activeColorPrimary: Colors.black,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}