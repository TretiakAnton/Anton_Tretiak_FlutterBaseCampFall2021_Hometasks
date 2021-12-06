import 'package:campnotes/widgets/auth_firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key key}) : super(key: key);
  static const String detailsScreenRoute = 'authorizationScreen';

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  TextEditingController _emailCheckController = TextEditingController();
  TextEditingController _passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _emailCheckController,
                decoration:
                    InputDecoration(labelText: 'Email', hintText: 'Email'),
              ),
              TextField(
                controller: _passwordCheckController,
                decoration: InputDecoration(
                    labelText: 'Password', hintText: 'Password'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () async {
                      if (_passwordCheckController.text.isEmpty ||
                          _emailCheckController.text.isEmpty) {
                        null;
                      } else {
                        context.read<AuthenticationService>().signIn(
                            email: _emailCheckController.text.trim(),
                            password: _passwordCheckController.text.trim());
                      }
                    },
                    child: Text('Log in')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("If don't have account: "),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('registrationScreen');
                      },
                      child: Text('Register')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
