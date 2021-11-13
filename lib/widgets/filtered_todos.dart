import 'package:campnotes/helpers/mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:campnotes/widgets/widgets.dart';
import 'package:campnotes/screens/screens.dart';

class FilteredTodos extends StatelessWidget {
  FilteredTodos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onTap: () async {},
          onCheckboxChanged: (_) {},
        );
      },
    );
  }
}
