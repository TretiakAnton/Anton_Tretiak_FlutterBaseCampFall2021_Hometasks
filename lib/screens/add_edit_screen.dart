import 'package:campnotes/data/models/todo.dart';
import 'package:campnotes/helpers/layout_padding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatefulWidget {
  final bool isEditing;
  final OnSaveCallback onSave;
  final Todo todo;

  AddEditScreen({
    Key key,
    @required this.onSave,
    @required this.isEditing,
    this.todo,
  }) : super(key: key ?? ArchSampleKeys.addTodoScreen);

  @override
  _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  TextEditingController _taskController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  String _task;
  String _note;
  double padding;
  CustomPadding temp;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.shortestSide;
    padding = temp.getPadding(10, deviceWidth);
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(padding),
          children: <Widget>[
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: ('What needs to be done?'),
              ),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 19.0,
              ),
            ),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                hintText: 'Additional notes...',
              ),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
              ),
              minLines: 15,
              maxLines: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_taskController.text.isEmpty || _noteController.text.isEmpty) {
            null;
          } else {
            _task = _taskController.text;
            print('$_task');
            _taskController.clear();
            _note = _noteController.text;
            print('$_note');
            _noteController.clear();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
