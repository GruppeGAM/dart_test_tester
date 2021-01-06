import 'package:flutter_test/flutter_test.dart';
import 'package:test_tester/async/async.dart';

abstract class AsyncTestcase {
  void validate() {
    test('throwExeptionAfter', () async {
      var impl = await instance();

      expect(impl.throwExceptionAfter(1), throwsException);

      var count = impl.count();
      expect(count, 1);
    });
  }

  Future<Async> instance();
}
