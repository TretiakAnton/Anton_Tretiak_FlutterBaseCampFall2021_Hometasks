import 'dart:async';
import 'dart:isolate';

import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';
import 'package:lecture_2_hometask_starter/helpers/random_number_hash_calculator.dart';

class SpawnedIsolateTaskPerformer extends HeavyTaskPerformer {
  Isolate? isolate;
  late Completer<String> _completer;

  @override
  Future<String> doSomeHeavyWork(int iterationsCount) async {
    _completer = Completer<String>();
    try {
      final spawnerReceivePort = ReceivePort();
      isolate = await Isolate.spawn(
              _establishCommunicationWithSpawner, spawnerReceivePort.sendPort);

      spawnerReceivePort.listen((message) {
        if (message is SendPort) {
          message.send(iterationsCount);
        } else if (message is String) {
          _completer.complete(message);
        }
      });
    } catch (e) {
      _completer.completeError(e);
    }
    return _completer.future;
  }

  static void _establishCommunicationWithSpawner(SendPort spawnerSendPort) {
    final spawneeReceivePort = ReceivePort();
    spawnerSendPort.send(spawneeReceivePort.sendPort);
    spawneeReceivePort.listen((message) {
      if (message is int) {
        final hashCalculator = RandomNumberHashCalculator();
        spawnerSendPort.send(
            hashCalculator.calculateRandomNumberHash(iterationsCount: message));
      }
    });
  }

  @override
  void stopDoSomeHeavyWork() {
    isolate?.kill();
  }
}
