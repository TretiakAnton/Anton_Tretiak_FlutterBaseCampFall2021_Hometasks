import 'package:flutter/material.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'package:campnotes/localization.dart';
import 'package:campnotes/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    TodosApp(),
  );
}

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FlutterBlocLocalizations().appTitle,
      theme: ArchSampleTheme.theme,
      localizationsDelegates: [
        ArchSampleLocalizationsDelegate(),
        FlutterBlocLocalizationsDelegate(),
      ],
      routes: {
        ArchSampleRoutes.home: (context) {
          return HomeScreen();
        },
        ArchSampleRoutes.addTodo: (context) {
          return AddEditScreen(
            key: ArchSampleKeys.addTodoScreen,
            onSave: (task, note) {},
            isEditing: false,
          );
        },
      },
    );
  }
}
