import 'package:campnotes/screens/authorithation_screen.dart';
import 'package:flutter/material.dart';
import 'database.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Authorization(),
    );
  }
}

enum TabItem { home, work, leisure }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.work: 'work',
  TabItem.leisure: 'leisure',
};
//init commit
