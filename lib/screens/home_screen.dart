import 'package:campnotes/bloc/models/app_tab.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:campnotes/widgets/widgets.dart';
import 'package:campnotes/localization.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activeTab = AppTab.todos;
    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterBlocLocalizations.of(context).appTitle),
        actions: [
          FilterButton(visible: activeTab == AppTab.todos),
          ExtraActions(),
        ],
      ),
      body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
      floatingActionButton: FloatingActionButton(
        key: ArchSampleKeys.addTodoFab,
        onPressed: () {
          Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
        },
        child: Icon(Icons.add),
        tooltip: ArchSampleLocalizations.of(context).addTodo,
      ),
      bottomNavigationBar: TabSelector(
        activeTab: activeTab,
        onTabSelected: (tab) {},
      ),
    );
  }
}
