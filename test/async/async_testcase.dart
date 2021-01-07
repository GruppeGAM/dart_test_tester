import 'package:flutter_test/flutter_test.dart';
import 'package:test_tester/async/async.dart';

abstract class AsyncTestcase {
  void validate() {
    group('throwExeptionAfter', () {
      test('simple call without waiting', () async {
        var impl = await instance();

        expect(impl.throwExceptionAfter(0), throwsException);

        await Future.delayed(Duration(seconds: 1));

        var count = impl.count();
        expect(count, 1);
      });
      test('simple call', () async {
        var impl = await instance();

        expect(impl.throwExceptionAfter(1), throwsException);

        var count = impl.count();
        expect(count, 1);
      });
      test('simple call with completion', () async {
        var impl = await instance();

        expect(impl.throwExceptionAfter(1), completion(throwsException));

        var count = impl.count();
        expect(count, 1);
      });
      test('call as a function', () async {
        var impl = await instance();

        expect(() => impl.throwExceptionAfter(1), throwsException);

        var count = impl.count();
        expect(count, 1);
      });

      test('call as a explicit async function with await', () async {
        var impl = await instance();

        expect(() async {
          await impl.throwExceptionAfter(1);
        }, throwsException);

        var count = impl.count();
        expect(count, 1);
      });

      test('simpel call expectLater', () async {
        var impl = await instance();

        expectLater(impl.throwExceptionAfter(1), throwsException);

        var count = impl.count();
        expect(count, 1);
      });
    });
  }

  Future<Async> instance();
}
