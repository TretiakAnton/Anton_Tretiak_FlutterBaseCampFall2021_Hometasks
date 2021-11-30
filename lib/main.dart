import 'dart:async';

import 'package:campnotes/repositories/user_repository.dart';
import 'package:campnotes/screens/authorithation_screen.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'user_dao.dart';

UserRepository userRepository;

Future<void> main() async {
  InitDatabase();
  runApp(MyApp());
}

Future<void> InitDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorFlutterDatabase
      .databaseBuilder('flutter_database.db')
      .build();
  userRepository = UserRepository(database: database);
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
