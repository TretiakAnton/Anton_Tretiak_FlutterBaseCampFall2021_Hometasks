import 'dart:async';

import 'package:campnotes/screens/authorithation_screen.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'database.dart';
import 'user_dao.dart';

Future<void> main() async {
  InitDatabase();
  runApp(MyApp());
}

Future<void> InitDatabase() async {
  WidgetsFlutterBinding.ensureInitialized();
//  final database = await $FloorFlutterDatabase.databaseBuilder('flutter_database.db').build();
}

final database =
    $FloorFlutterDatabase.databaseBuilder('flutter_database.db').build();

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

abstract class UserRepository implements FlutterDatabase {
  final database =
      $FloorFlutterDatabase.databaseBuilder('flutter_database.db').build();
  UserDao userDao = database.taskdao;
  Future<bool> checkUser(
      {@required String email, @required String password}) async {
    bool isChecked;

    UserDao userDao;
    final Stream<User> result = await userDao.findUserByMail(email);
    await result.listen((user1) {
      User checkUser = user1;
      if (checkUser.password == password) {
        isChecked = true;
      } else {
        isChecked = false;
      }
    });
    return isChecked;
  }

  Future<void> addData(
      {@required String email, @required String password}) async {
    UserDao userDao;
    final user = User(email, password);
    await userDao.insertPerson(user);
  }
}
