import 'package:flutter/foundation.dart';
import 'package:lecture_2_hometask_starter/constants.dart';
import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';
import 'package:lecture_2_hometask_starter/random_number_hash_calculator.dart';

class ComputeHeavyTaskPerformer extends HeavyTaskPerformer {

  Future<String>doSomeHeavyWork() {
    final result = compute<int, String>(calculateHash, DefaultIterationsCount);
    return result;
  }

}