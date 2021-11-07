import 'dart:async';
import 'dart:isolate';
import 'package:lecture_2_hometask_starter/constants.dart';

import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';
import 'package:lecture_2_hometask_starter/helpers/random_number_hash_calculator.dart';

class SpawnedIsolateTaskPerformer implements HeavyTaskPerformer {
  Isolate? isolate;
  late Completer _completer;

  @override
  Future<String> doSomeHeavyWork() async {
    _completer = Completer<String>();
    try {
      final spawnerReceivePort = ReceivePort();
      isolate = Isolate.spawn(
              _establishCommunicationWithSpawner, spawnerReceivePort.sendPort)
          as Isolate?;
      
      spawnerReceivePort.listen((message) {
        if(message is SendPort){
          message.send(DefaultIterationsCount);
        } else if(message is String){
          _completer.complete(message);
        }
      });
    } catch (e) {
      _completer.completeError(e);
    }

    return _completer.future as String;
  }

  static void _establishCommunicationWithSpawner(SendPort spawnerSendPort) {
    final spawneeReceivePort= ReceivePort();
    spawnerSendPort.send(spawneeReceivePort.sendPort);
    spawneeReceivePort.listen((message) {
      if(message is int){
        final hashCalculator = RandomNumberHashCalculator();
        spawnerSendPort.send( hashCalculator.calculateRandomNumberHash(iterationsCount: DefaultIterationsCount));
      }
    });
  }
}
