import 'package:campnotes/screens/details_screen.dart';
import 'package:campnotes/widgets/todo_item.dart';
import 'package:flutter/material.dart';

import 'data/models/todo.dart';
import 'screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String name = settings.name;
    final Object arguments = settings.arguments;

    if (name == null) {
      return RouteGenerator.onUnknownRoute(settings);
    }

    switch (name) {
      case DetailsScreen.detailsScreenRoute:
        Todo todoArgument;
        if (arguments is Todo) {
          todoArgument = arguments;
        }
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            todo: todoArgument,
          ),
        );

      case HomeScreen.detailsScreenRoute:
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
