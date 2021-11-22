import 'package:campnotes/data/models/todo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Todo todo;

/*  final String task;
  final String note;*/
  static const String detailsScreenRoute = 'detailsScreen';

  const DetailsScreen({Key key, @required this.todo}) : super(key: key);

  /* DetailsScreen({Key key, @required this.task, @required this.note})
      : super(key: key ?? ArchSampleKeys.todoDetailsScreen);*/

  @override
  State<StatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    String task = widget.todo.task;
    String note = widget.todo.note;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Task is: \n $task ',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              //width: 10,
              height: 30,
            ),
            Text('Note: \n $note', textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
