import 'package:lecture_2_hometask_starter/constants.dart';
import 'package:lecture_2_hometask_starter/hash_calculator/heavy_task_performer.dart';
import 'package:lecture_2_hometask_starter/helpers/random_number_hash_calculator.dart';

class MainIsolateTaskPerformer implements HeavyTaskPerformer {
  @override
  Future<String> doSomeHeavyWork() async {
    final hashCalculator = RandomNumberHashCalculator();
    return hashCalculator.calculateRandomNumberHash(iterationsCount: DefaultIterationsCount);
  }
}
