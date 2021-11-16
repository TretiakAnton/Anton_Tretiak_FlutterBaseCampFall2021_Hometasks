import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'hash_calculator/spawned_isolate_task_performer.dart';

int _iterationCount = 0;

class CounterCubit extends Cubit<HashCalculationPageState> {
  CounterCubit()
      : super(HashCalculationPageState(
            hashInfoValue: '', isCalculatingHash: false));

  final _taskPerfomer = SpawnedIsolateTaskPerformer();

  Future<void> run(int iterationCount) async {
    String result;
    emit(HashCalculationPageState(
      isCalculatingHash: true,
      hashInfoValue: '',
    ));
    result = await _taskPerfomer.doSomeHeavyWork(iterationCount);
    emit(HashCalculationPageState(
      isCalculatingHash: false,
      hashInfoValue: result,
    ));
  }

  void stop() {
    String result = 'Task stopped';
    _taskPerfomer.stopDoSomeHeavyWork();
    emit(HashCalculationPageState(
      isCalculatingHash: false,
      hashInfoValue: result,
    )); //how to give result?
  }
}

class HashCalculationPageState {
  HashCalculationPageState(
      {required this.isCalculatingHash, required this.hashInfoValue});

  final bool isCalculatingHash;
  final String hashInfoValue;
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              CounterTextWidget(),
              TextField(
                  keyboardType: TextInputType.number,
                  controller: _iterationsController,
                  decoration: InputDecoration(
                      hintText: 'iterations count',
                      border: OutlineInputBorder()),
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
        ),
      ),
    );
  }
}

class CounterTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, HashCalculationPageState>(
      builder: (context, state) {
        return Center(
          child: state.isCalculatingHash
              ? CircularProgressIndicator()
              : Text('hash value is: \n ${state.hashInfoValue}'),
        );
      },
    );
  }
}
