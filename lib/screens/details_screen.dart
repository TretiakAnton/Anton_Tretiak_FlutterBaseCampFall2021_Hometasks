import 'package:campnotes/data/models/todo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Todo todo;

  static const String detailsScreenRoute = 'detailsScreen';

  const DetailsScreen({Key key, @required this.todo}) : super(key: key);

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
            Icon(Icons.description),
            Text(
              'Task is: \n $task ',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Text('Note: \n $note', textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
