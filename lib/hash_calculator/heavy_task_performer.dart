import 'package:lecture_2_hometask_starter/random_number_hash_calculator.dart';

abstract class HeavyTaskPerformer {
  Future<String>doSomeHeavyWork();
  static String calculateHash(int iterationsCount) {
    final randomNumberHashCalculator = RandomNumberHashCalculator();
    return randomNumberHashCalculator.calculateRandomNumberHash(iterationsCount: iterationsCount);
  }
}