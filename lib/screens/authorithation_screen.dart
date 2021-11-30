import 'package:campnotes/main.dart';
import 'package:campnotes/user_dao.dart';
import 'package:flutter/material.dart';

import '../database.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key key}) : super(key: key);

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  TextEditingController _emailCheckController = TextEditingController();
  TextEditingController _passwordCheckController = TextEditingController();
  String _emailCheck;
  String _passwordCheck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _emailCheckController,
              decoration:
                  InputDecoration(labelText: 'Password', hintText: 'Password'),
            ),
            TextField(
              controller: _passwordCheckController,
            ),
            OutlinedButton(
                onPressed: () async {
                  if (_passwordCheckController.text.isEmpty ||
                      _emailCheckController.text.isEmpty) {
                    null;
                  } else {
                    _passwordCheck = _passwordCheckController.text;
                    _emailCheck = _emailCheckController.text;
                    _passwordCheckController.clear();
                    _emailCheckController.clear();
                    bool check = await database.userDao.(
                        email: _emailCheck, password: _passwordCheck);
                    if (check) {
                      Navigator.of(context).pushNamed('/appScreen');
                    } else {
                      Navigator.of(context).pushNamed('/registration');
                    }
                  }
                },
                child: Text('Log in')),
            Row(
              children: [
                Text("if don't have account: "),
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/registration');
                    },
                    child: Text('Register')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*

Future<bool> checkUser({@required String email, @required String password}) async {
  bool isChecked;
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorFlutterDatabase
      .databaseBuilder('flutter_database.db')
      .build();
  final UserDao userDao = database.taskDao;
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
*/
