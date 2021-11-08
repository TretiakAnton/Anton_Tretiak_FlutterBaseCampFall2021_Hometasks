import 'package:flutter/foundation.dart';
import 'package:lecture_2_hometask_starter/constants.dart';
import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';
import 'package:lecture_2_hometask_starter/helpers/random_number_hash_calculator.dart';

class ComputeHeavyTaskPerformer implements HeavyTaskPerformer {
  @override
  Future<String> doSomeHeavyWork() {
    //RandomNumberHashCalculator hashCalculator=RandomNumberHashCalculator();
    return compute<int, String>(
        RandomNumberHashCalculator.calculateRandomNumberHash,
        DefaultIterationsCount);
  }
}
