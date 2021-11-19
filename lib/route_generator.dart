import 'package:campnotes/screens/details_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String name = settings.name;
    final Object task = settings.arguments;

    if (name == null) {
      return RouteGenerator.onUnknownRoute(settings);
    }

    switch (name) {
      case detailsScreen:
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            task: '',
            note: '',
          ),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      default:
        return RouteGenerator.onUnknownRoute(settings);
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Page not found'),
        ),
      );
    });
  }
}
