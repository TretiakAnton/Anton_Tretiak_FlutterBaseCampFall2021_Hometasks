import 'package:campnotes/repositories/user_repository.dart';
import 'package:campnotes/user_dao.dart';
import 'package:flutter/material.dart';

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
                    UserRepository repo;
                    User user = await repo.getUserByEmail(_emailCheck);
                    if (user.password == _passwordCheck) {
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
