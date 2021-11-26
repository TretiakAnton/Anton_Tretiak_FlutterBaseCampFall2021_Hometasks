import 'package:campnotes/data/models/todo.dart';
import 'package:campnotes/screens/screens.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../filtered_todos.dart';

class StackNavigatorChild extends StatelessWidget {
  final TabItem tab;
  final bool isVisible;
  final GlobalKey<NavigatorState> navigationKey;

  const StackNavigatorChild(this.tab, this.isVisible, this.navigationKey,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: !isVisible,
      child: Container(
        // color: activeTabColor[tab],
        child: Navigator(
          key: navigationKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            final String routeName = settings.name ?? '/';

            if (routeName == '/') {
              return MaterialPageRoute(
                settings: settings,
                builder: (_) {
                  return FilteredTodos(tab);
                  //ColorListPage(tab);
                },
              );
            }

            if (routeName == '/details') {
              final Todo todo = settings.arguments;
              return MaterialPageRoute(
                settings: settings,
                builder: (_) {
                  return DetailsScreen(
                    todo: todo,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
