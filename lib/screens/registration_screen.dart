import 'package:campnotes/repositories/user_repository.dart';
import 'package:campnotes/user_dao.dart';
import 'package:campnotes/widgets/auth_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../main.dart';

class Registration extends StatefulWidget {
  const Registration({Key key}) : super(key: key);
  static const String detailsScreenRoute = 'registrationScreen';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _email;
  String _password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration:
                    InputDecoration(labelText: 'Email', hintText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: 'Password', hintText: 'Password'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () async {
                      if (_passwordController.text.isEmpty ||
                          _emailController.text.isEmpty) {
                        null;
                      } else {
                        context.read<AuthenticationService>().signUp(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim());
                      }
                      Navigator.of(context).pushNamed('authorizationScreen');
                    },
                    child: Text('Register new user')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
