import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture_2_hometask_starter/blocks/hash_calculations/hash_calculation_bloc.dart';

int _iterationCount = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo default',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (_) => HashCalculationCubit(),
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
                      context.read<HashCalculationCubit>().run(_iterationCount),
                  tooltip: 'Run',
                  child: Icon(Icons.add)),
              FloatingActionButton(
                onPressed: () => context.read<HashCalculationCubit>().stop(),
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
    return BlocBuilder<HashCalculationCubit, HashCalculationPageState>(
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
