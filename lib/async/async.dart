abstract class Async {
  int count();

  Future<void> throwExceptionAfter(int sec);
}

class ImplAsync extends Async {
  int _count = 0;
  @override
  int count() => _count;

  @override
  Future<void> throwExceptionAfter(int sec) async {
    await Future.delayed(Duration(seconds: sec));

    _count++;

    throw Exception();
  }
}
