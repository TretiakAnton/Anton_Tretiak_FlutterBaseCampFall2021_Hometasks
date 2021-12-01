import 'package:campnotes/repositories/user_repository.dart';
import 'package:campnotes/user_dao.dart';
import 'package:flutter/material.dart';

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
                        _password = _passwordController.text;
                        _email = _emailController.text;
                        _passwordController.clear();
                        _emailController.clear();
                        UserRepository repo =
                            UserRepository(database: database);
                        var user1 = User(_email, _password);
                        print(user1.mail);
                        print(user1.password);
                        await repo.saveUser(user1);
                      }
                      Navigator.of(context).pushNamed('authorizationScreen');
                    },
                    child: Text('Register')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
