import 'package:flutter/material.dart';
import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';
import 'package:lecture_2_hometask_starter/hash_calculator/main_isolate_task_performer.dart';

void main() {
  runApp(
    MyApp(
      taskPerformer: MainIsolateTaskPerformer(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.taskPerformer,
  }) : super(key: key);

  final HeavyTaskPerformer taskPerformer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        taskPerformer: taskPerformer,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.taskPerformer,
  }) : super(key: key);

  final String title;
  final HeavyTaskPerformer taskPerformer;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String heavyTaskResult = '';
  bool isPerformingTask = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Heavy task result is equal to: $heavyTaskResult',
                textAlign: TextAlign.center,
              ),
              isPerformingTask
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isPerformingTask = true;
                          heavyTaskResult = '';
                        });

                        final taskResult =
                            await widget.taskPerformer.doSomeHeavyWork();

                        setState(() {
                          isPerformingTask = false;
                          heavyTaskResult = taskResult;
                        });
                      },
                      child: const Text('Perform Heavy Task'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
