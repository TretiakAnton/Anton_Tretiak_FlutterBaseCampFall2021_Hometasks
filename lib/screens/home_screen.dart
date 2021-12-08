import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:campnotes/localization.dart';
import 'package:campnotes/main.dart';
import 'package:campnotes/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class HomeScreen extends StatelessWidget {
  static const String detailsScreenRoute = 'homeScreen';
  final TabItem tab;

  const HomeScreen({Key key, this.tab}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final activeTab = AppTab.todos;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'Home', icon: Icon(Icons.house)),
              Tab(
                  text: 'Work',
                  icon: Icon(Icons.account_balance_wallet_rounded)),
              Tab(text: 'Leisure', icon: Icon(Icons.airplanemode_active)),
            ],
          ),
          //title: Text(FlutterBlocLocalizations.of(context).appTitle),
          actions: [
            FilterButton(visible: activeTab == AppTab.todos),
            ExtraActions(),
          ],
        ),
        body: TabBarView(
          children: [
            Center(
              child: Container(child: FilteredTodos(tab)),
            ),
            Center(
              child: FilteredTodos(tab),
            ),
            Center(
              child: FilteredTodos(tab),
            ),
          ],
        ),
        //activeTab == AppTab.todos ? FilteredTodos() : Stats(),
        floatingActionButton: FloatingActionButton(
          key: ArchSampleKeys.addTodoFab,
          onPressed: () {
            Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
          },
          child: Icon(Icons.add),
          //tooltip: ArchSampleLocalizations.of(context).addTodo,
        ),
        bottomNavigationBar: TabSelector(
          activeTab: activeTab,
          onTabSelected: (tab) {},
        ),
      ),
    );
  }
}
//5 hw init
