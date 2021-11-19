import 'package:flutter_bloc/flutter_bloc.dart';

import '../../spawned_isolate_task_performer.dart';

class HashCalculationCubit extends Cubit<HashCalculationPageState> {
  HashCalculationCubit()
      : super(HashCalculationPageState(
            hashInfoValue: '', isCalculatingHash: false));

  final _taskPerfomer = SpawnedIsolateTaskPerformer();

  Future<void> run(String iterationCount) async {
    String result;
    int count = int.parse(iterationCount);
    emit(HashCalculationPageState(
      isCalculatingHash: true,
      hashInfoValue: '',
    ));
    result = await _taskPerfomer.doSomeHeavyWork(count);
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
