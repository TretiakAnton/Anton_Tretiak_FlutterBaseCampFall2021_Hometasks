import 'dart:async';

import 'package:campnotes/user_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [User])
abstract class FlutterDatabase extends FloorDatabase {
  UserDao get taskDao;
}
