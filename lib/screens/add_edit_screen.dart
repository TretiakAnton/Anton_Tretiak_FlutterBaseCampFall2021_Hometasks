import 'package:campnotes/data/models/todo.dart';
import 'package:campnotes/helpers/layout_padding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatefulWidget {
  static const String detailsScreenRoute = 'addEditScreen';
  final Todo todo;

  AddEditScreen({
    Key key,
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
  double _padding;
  final CustomPadding temp = new CustomPadding();
  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 80 : 50;
      _large = !_large;
    });
  }

  // bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    int deviceWidth = MediaQuery.of(context).size.shortestSide.toInt();
    _padding = temp.getPadding(10, deviceWidth);
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(_padding),
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
      floatingActionButton: GestureDetector(
        onLongPress: _updateSize,
        child: AnimatedSize(
          curve: Curves.easeInOutSine,
          duration: const Duration(seconds: 1),
          child: Container(
            width: _size,
            height: _size,
            child: FittedBox(
              child: FloatingActionButton(
                mini: true,
                onPressed: () {
                  if (_taskController.text.isEmpty ||
                      _noteController.text.isEmpty) {
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
            ),
          ),
        ),
      ),
    );
  }
}
