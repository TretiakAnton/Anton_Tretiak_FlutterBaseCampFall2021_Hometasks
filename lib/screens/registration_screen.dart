import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);
  static const String detailsScreenRoute = 'registrationScreen';
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration:
                  InputDecoration(labelText: 'Password', hintText: 'Password'),
            ),
            TextField(
              controller: _passwordController,
            ),
            OutlinedButton(
                onPressed: () {
                  if (_passwordController.text.isEmpty ||
                      _emailController.text.isEmpty) {
                    null;
                  } else {
                    _password = _passwordController.text;
                    _passwordController.clear();
                    _email = _emailController.text;
                    _emailController.clear();
                  }
                  Navigator.of(context).pop();
                },
                child: Text('Register')),
          ],
        ),
      ),
    );
  }
}
