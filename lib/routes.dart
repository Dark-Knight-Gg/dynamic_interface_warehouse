import 'package:dynamic_interface_warehouse/screen/defaultPage.dart';
import 'package:dynamic_interface_warehouse/screen/error.dart';
import 'package:dynamic_interface_warehouse/screen/page1.dart';
import 'package:dynamic_interface_warehouse/screen/page2.dart';
import 'package:dynamic_interface_warehouse/screen/page3.dart';
import 'package:dynamic_interface_warehouse/screen/page_demo.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String demoPage = "/Demo";
  static const String defaultPage = "/";
  static const String page1 = "/Page1";
  static const String page2 = "/Page2";
  static const String page3 = "/Page3";
}

class RouteGenerator {
  static RouteSettings? routeDefaultSettings;

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    routeDefaultSettings = routeSettings;
    try {
      Map? args;
      if (routeSettings.arguments != null) {
        args = routeSettings.arguments as Map;
      }
      switch (routeSettings.name) {
        case Routes.demoPage:
          return MaterialPageRoute(
            builder: (_) => const DemoPage(),
          );
        case Routes.defaultPage:
          return MaterialPageRoute(
            builder: (_) => const DefaultPage(),
          );
        case Routes.page1:
          return MaterialPageRoute(builder: (_) => const Page1());
        case Routes.page2:
          return MaterialPageRoute(builder: (_) => const Page2());
        case Routes.page3:
          return MaterialPageRoute(builder: (_) => const Page3());
        default:
          return errorRoute(routeSettings);
      }
    } catch (e) {
      return errorRoute(routeSettings);
    }
  }

  /// Method that calles the error screen when neccesary
  static Route<dynamic> errorRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => const ErrorScreen(),
    );
  }
}
