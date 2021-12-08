import 'package:flutter/material.dart';

import 'data/models/todo.dart';
import 'screens/screens.dart';

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

      case App.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => App(),
        );

      case AddEditScreen.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => AddEditScreen(),
        );

      case Registration.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => Registration(),
        );

      case Authorization.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => Authorization(),
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
