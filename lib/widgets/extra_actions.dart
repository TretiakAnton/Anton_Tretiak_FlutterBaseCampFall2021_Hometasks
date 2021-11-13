import 'package:campnotes/bloc/models/extra_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:campnotes/flutter_todos_keys.dart';

class ExtraActions extends StatelessWidget {
  ExtraActions({Key key}) : super(key: ArchSampleKeys.extraActionsButton);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ExtraAction>(
      key: FlutterTodosKeys.extraActionsPopupMenuButton,
      onSelected: (action) {
        switch (action) {
          case ExtraAction.clearCompleted:
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuItem<ExtraAction>>[
        PopupMenuItem<ExtraAction>(
          key: ArchSampleKeys.clearCompleted,
          value: ExtraAction.clearCompleted,
          child: Text(
            ArchSampleLocalizations.of(context).clearCompleted,
          ),
        ),
      ],
    );
  }
}
