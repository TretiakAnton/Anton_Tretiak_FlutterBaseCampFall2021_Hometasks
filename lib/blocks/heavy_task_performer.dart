abstract class HeavyTaskPerformer {
  Future<String> doSomeHeavyWork(int iterationCount);

  void stopDoSomeHeavyWork();
}
