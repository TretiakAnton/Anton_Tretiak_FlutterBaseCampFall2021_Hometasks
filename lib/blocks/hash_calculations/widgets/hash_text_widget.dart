import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lecture_2_hometask_starter/blocks/hash_calculations/widgets/hash_calculation_cubit.dart';
import 'package:lecture_2_hometask_starter/blocks/hash_calculations/widgets/home_page.dart';

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

class HashTextWidget extends StatelessWidget {
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
