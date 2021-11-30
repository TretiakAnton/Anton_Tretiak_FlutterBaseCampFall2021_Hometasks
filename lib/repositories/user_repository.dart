import 'package:campnotes/database.dart';
import 'package:campnotes/user_dao.dart';
import 'package:flutter/foundation.dart';

class UserRepository {
  UserRepository({@required FlutterDatabase database}) : _db = database;

  final FlutterDatabase _db;

  Future<User> getUserByEmail(String email) {
    return _db.taskDao.findUserByMail(email);
  }

  Future<void> saveUser(User user) async {
    await _db.taskDao.insertPerson(user);
  }
}
