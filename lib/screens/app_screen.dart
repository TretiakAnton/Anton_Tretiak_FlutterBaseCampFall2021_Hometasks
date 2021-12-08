import 'package:campnotes/widgets/auth_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todos_app_core/todos_app_core.dart';

import '../main.dart';
import '../widgets/custom_widgets/bottom_navigation.dart';
import '../widgets/custom_widgets/stack_navigation.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);
  static const String detailsScreenRoute = 'appScreen';

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  TabItem _currentTab = TabItem.home;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.work: GlobalKey<NavigatorState>(),
    TabItem.leisure: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final hasPopped =
            await navigatorKeys[_currentTab].currentState.maybePop();
        if (hasPopped) {
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            StackNavigatorChild(
              TabItem.home,
              _currentTab == TabItem.home,
              navigatorKeys[TabItem.home],
            ),
            StackNavigatorChild(
              TabItem.work,
              _currentTab == TabItem.work,
              navigatorKeys[TabItem.work],
            ),
            StackNavigatorChild(
              TabItem.leisure,
              _currentTab == TabItem.leisure,
              navigatorKeys[TabItem.leisure],
            ),
            OutlinedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Text('Sign Out'))
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: (TabItem newTab) {
            setState(() {
              _currentTab = newTab;
              // Unkomment to clear navigation stack of 1st and 2nd pages
              if (_currentTab == TabItem.leisure) {
                navigatorKeys[TabItem.home]
                    .currentState
                    .popUntil(ModalRoute.withName('/'));
                navigatorKeys[TabItem.work]
                    .currentState
                    .popUntil((route) => route.settings.name == '/');
              }
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('addEditScreen');
          },
          child: Icon(Icons.add),
          tooltip: 'Add todo',
        ),
      ),
    );
  }
}
