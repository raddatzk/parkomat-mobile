import 'package:flutter/material.dart';
import 'package:parkomat/ui/home/home.dart';
import 'package:parkomat/ui/settings/settings.dart';

typedef PageRouteBuilder PageRouteBuilderBuilder();

class RouteBuilder {
  RouteBuilder._();

  static final routes = <Routes, PageRouteBuilderBuilder>{
    Routes.home: () => PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) => HomeScreen(),
          transitionsBuilder: (context, animation, __, child) => FadeTransition(opacity: animation, child: child),
        ),
    Routes.settings: () => PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) => SettingsScreen(),
          transitionsBuilder: (context, animation, __, child) => FadeTransition(opacity: animation, child: child),
        ),
  };

  static PageRouteBuilder build(BuildContext context, Routes route) {
    return routes[route]();
  }
}

enum Routes { home, settings }
