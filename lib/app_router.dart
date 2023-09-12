import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_native_view/home_page.dart';
import 'package:test_flutter_native_view/second_page.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyHomePage.routeName:
        return MaterialPageRoute<MyHomePage>(
          builder: (_) => const MyHomePage(),
          settings: settings,
        );
      case SecondPage.routeName:
        return MaterialPageRoute<SecondPage>(
          builder: (_) => const SecondPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute<Scaffold>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}