import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture_2_hometask_starter/blocks/hash_calculations/widgets/HashTextWidget.dart';
import '../hash_calculation_bloc.dart';
import '../hash_calculation_page_state.dart';

String _iterationCount = "";

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _iterationsController = TextEditingController();

  _getData(String data) {
    _iterationCount = data;
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
              HashTextWidget(),
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
