import 'dart:async';
import 'dart:isolate';

import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';

class SpawnedIsolateTaskPerformer implements HeavyTaskPerformer {

  Isolate? _isolate;
  Completer? _completer;

  @override
  Future<String> doSomeHeavyWork() {
    throw UnimplementedError();
  }
}