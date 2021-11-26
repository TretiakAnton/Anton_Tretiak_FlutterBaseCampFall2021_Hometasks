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
                onPressed: () {
                  if (_passwordCheckController.text.isEmpty ||
                      _emailCheckController.text.isEmpty) {
                    null;
                  } else {
                    _passwordCheck = _passwordCheckController.text;
                    _passwordCheckController.clear();
                    _emailCheck = _emailCheckController.text;
                    _emailCheckController.clear();
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
