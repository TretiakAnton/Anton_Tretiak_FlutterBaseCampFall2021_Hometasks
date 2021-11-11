import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture_2_hometask_starter/hash_calculator/main_isolate_task_performer.dart';

int _iterationCount = 0;

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void run(int iterationCount) {
    final task = MainIsolateTaskPerformer();
    String result;
    result = task.doSomeHeavyWork(iterationCount) as String;
    //emit(state += result!);
  }

  void stop() {
    final task = MainIsolateTaskPerformer();
    String result = 'Task stopped';
    task.stopDoSomeHeavyWork();
    emit(state); //how to give result?
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo default',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: MyHomePage(title: 'Flutter Demo Bloc'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _iterationsController = TextEditingController();

  _getData(String data) {
    _iterationCount = int.parse(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CounterTextContainerWidget(),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
              keyboardType: TextInputType.number,
              controller: _iterationsController,
              decoration: InputDecoration(
                  hintText: 'iterations count', border: OutlineInputBorder()),
              onSubmitted: _getData),
          FloatingActionButton(
              onPressed: () =>
                  context.read<CounterCubit>().run(_iterationCount),
              tooltip: 'Run',
              child: Icon(Icons.add)),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().stop(),
            tooltip: 'Stop',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class CounterTextContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
        SizedBox(
          height: 30,
        ),
        CounterTextWidget(),
      ],
    );
  }
}

class CounterTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.qr_code_rounded),
        SizedBox(
          width: 30,
        ),
        BlocBuilder<CounterCubit, int>(
          builder: (context, result) => Center(child: Text('$result')),
        ),
      ],
    );
  }
}
