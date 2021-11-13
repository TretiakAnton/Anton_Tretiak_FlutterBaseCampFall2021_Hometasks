import 'package:flutter/foundation.dart';

class TodoNetworkModel {
  TodoNetworkModel({
    @required this.todoId,
    @required this.title,
    @required this.notes,
    @required this.isCompleted,
  });

  final String todoId;
  final String title;
  final String notes;
  final bool isCompleted;
}
