import 'package:campnotes/screens/details_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String name = settings.name;
    final Object arguments = settings.arguments;

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

      /*case secondPage:
        return MaterialPageRoute(
          builder: (_) => SecondPage(
            arguments: arguments as SecondPageArguments,
          ),
        );*/

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
