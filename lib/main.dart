import 'package:campnotes/screens/screens.dart';
import 'package:campnotes/widgets/filtered_todos.dart';
import 'package:flutter/material.dart';
import 'data/models/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}

enum TabItem { home, work, leisure }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.work: 'work',
  TabItem.leisure: 'leisure',
};

class BottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  const BottomNavigation({Key key, this.currentTab, this.onSelectTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.home),
        _buildItem(TabItem.work),
        _buildItem(TabItem.leisure),
      ],
      onTap: (index) => onSelectTab(TabItem.values[index]),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.layers,
      ),
      label: tabName[tabItem],
    );
  }
}

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

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
      ),
    );
  }
}

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

class ColorListPage extends StatelessWidget {
  final TabItem tabItem;

  final List<int> materialIndices = [
    900,
    800,
    700,
    600,
    500,
    400,
    300,
    200,
    100,
    50
  ];

  ColorListPage(this.tabItem, {Key key}) : super(key: key);
  TabItem tab;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: activeTabColor[tabItem],
        title: Text(tabName[tabItem]),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: FilteredTodos(tab),
      /*Builder(builder: (BuildContext context) {
        final localizations = ArchSampleLocalizations.of(context);
        final todos = mockTodos;
        return ListView.builder(
          key: ArchSampleKeys.todoList,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            final todo = todos[index];
            return TodoItem(
              todo: todo,
              onDismissed: (direction) {
                ScaffoldMessenger.of(context).showSnackBar(DeleteTodoSnackBar(
                  key: ArchSampleKeys.snackbar,
                  todo: todo,
                  onUndo: () {},
                  localizations: localizations,
                ));
              },
              onTap: () {
                Navigator.of(context).pushNamed('/details', arguments: todo);
              },
              onCheckboxChanged: (_) {},
            );
          },
        );
      }),*/
    );
  }
}

class ColorDetailPage extends StatelessWidget {
  final TabItem tabItem;
  final int colorIndex;

  const ColorDetailPage(this.tabItem, this.colorIndex, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabName[tabItem] + '[$colorIndex]'),
        centerTitle: true,
      ),
    );
  }
}
