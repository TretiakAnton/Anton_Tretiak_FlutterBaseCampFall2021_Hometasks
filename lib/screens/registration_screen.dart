import 'package:campnotes/user_dao.dart';
import 'package:flutter/material.dart';
import '../database.dart';

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
                    _email = _emailController.text;
                    _passwordController.clear();
                    _emailController.clear();
                    addData(password: _password, email: _email);
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

Future<void> addData(
    {@required String email, @required String password}) async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await $FloorFlutterDatabase
      .databaseBuilder('flutter_database.db')
      .build();
  final userDao = database.taskDao;
  final user = User(email, password);
  await userDao.insertPerson(user);
}
