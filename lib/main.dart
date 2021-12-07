import 'dart:async';

import 'package:campnotes/screens/authorization_screen.dart';
import 'package:campnotes/screens/screens.dart';
import 'package:campnotes/widgets/auth_firebase.dart';
import 'package:campnotes/screens/app_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'database.dart';
import 'route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            //App(),
            Authorization(),
      ),
    );
  }
}

enum TabItem { home, work, leisure }

const Map<TabItem, String> tabName = {
  TabItem.home: 'home',
  TabItem.work: 'work',
  TabItem.leisure: 'leisure',
};
//init 10 hw impl
