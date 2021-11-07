import 'package:flutter/foundation.dart';
import 'package:lecture_2_hometask_starter/constants.dart';
import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';

class ComputeHeavyTaskPerformer implements HeavyTaskPerformer {
  late ComputeCallback<int, String> calculateRandomNumberHash;

  @override
  Future<String> doSomeHeavyWork() {
    //RandomNumberHashCalculator hashCalculator = RandomNumberHashCalculator();

    return compute<int, String>(
        calculateRandomNumberHash, DefaultIterationsCount);
  }
}