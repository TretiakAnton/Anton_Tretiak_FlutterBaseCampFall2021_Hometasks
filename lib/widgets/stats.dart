import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:todos_app_core/todos_app_core.dart';

class Stats extends StatelessWidget {
  Stats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              ArchSampleLocalizations.of(context).completedTodos,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              '0',
              key: ArchSampleKeys.statsNumCompleted,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              ArchSampleLocalizations.of(context).activeTodos,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              "2",
              key: ArchSampleKeys.statsNumActive,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
