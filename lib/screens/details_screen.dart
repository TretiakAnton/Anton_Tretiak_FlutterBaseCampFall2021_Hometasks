import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';

class DetailsScreen extends StatefulWidget {
  final String id;

  DetailsScreen({Key key, @required this.id})
      : super(key: key ?? ArchSampleKeys.todoDetailsScreen);

  @override
  State<StatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
