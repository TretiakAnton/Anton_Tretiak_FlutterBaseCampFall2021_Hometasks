import 'package:campnotes/data/models/todo.dart';
import 'package:campnotes/helpers/mocks.dart';
import 'package:campnotes/widgets/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todos_app_core/todos_app_core.dart';

import '../main.dart';

class FilteredTodos extends StatelessWidget {
  FilteredTodos(this.tabItem, {Key key}) : super(key: key);

  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tabName[tabItem]),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Builder(builder: (BuildContext context) {
        final localizations = ArchSampleLocalizations.of(context);
        final todos = mockTodos;
        return ListView.builder(
          key: ArchSampleKeys.todoList,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            final Todo todo = todos[index];
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
      }),
    );
  }
}
