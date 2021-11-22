import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class DetailsScreen extends StatefulWidget {
  final String task;
  final String note;
  static const String detailsScreenRoute = 'detailsScreen';

  DetailsScreen({Key key, @required this.task, @required this.note})
      : super(key: key ?? ArchSampleKeys.todoDetailsScreen);

  @override
  State<StatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    String task = widget.task;
    String note = widget.note;
    return Center(
      child: Column(
        children: [
          Text('Task is: $task \n'),
          Placeholder(
            fallbackWidth: 30,
            color: Colors.white,
          ),
          Text('Note: $note')
        ],
      ),
    );
  }
}
