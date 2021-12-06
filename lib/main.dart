import 'dart:async';

import 'package:campnotes/screens/authorization_screen.dart';
import 'package:campnotes/widgets/custom_widgets/app_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'database.dart';
import 'route_generator.dart';

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}
/*
FlutterDatabase database;

Future<void> InitDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await $FloorFlutterDatabase
      .databaseBuilder('flutter_database.db')
      .build();
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          //App(),
          Authorization(),
    );
  }
}

enum TabItem { home, work, leisure }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.work: 'work',
  TabItem.leisure: 'leisure',
};
//init 8 hw implement
