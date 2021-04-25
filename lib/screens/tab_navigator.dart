import 'package:google_fonts/google_fonts.dart';
import 'package:os_seekho/util/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:os_seekho/screens/create_ad_screen.dart';
import 'package:os_seekho/screens/home_screen.dart';
import 'package:os_seekho/screens/my_ad_screen.dart';
import 'package:os_seekho/screens/profile_screen.dart';
import 'map_screen.dart';

class TabNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;
  TabNavigator({this.navigatorKey, this.tabItem});

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  @override
  Widget build(BuildContext context) {
    Widget child;

    if (widget.tabItem == "Home")
      child = HomeScreen();
    else if (widget.tabItem == "MyAd")
      child = MyAdScreen();
    else if (widget.tabItem == "CreateAd")
      child = CreateAdScreen();
    else if (widget.tabItem == "Map")
      child = MapScreen();
    else if (widget.tabItem == "Profile") child = ProfileScreen();

    return Navigator(
      key: widget.navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => child,
        );
      },
    );
  }
}
