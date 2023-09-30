import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/login_view.dart';

class RouteNames {
  static const String login = 'login_screen';
  static const String home = 'home_screen';
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case RouteNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Scaffold(
                  body: Center(
                    child: Text('No Route Defined'),
                  ),
                ));
    }
  }
}
