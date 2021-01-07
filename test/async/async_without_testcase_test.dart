import 'package:flutter_test/flutter_test.dart';
import 'package:test_tester/async/async.dart';

void main() {
  Async impl;
  setUp(() {
    impl = ImplAsync();
  });
  group('throwExeptionAfter', () {
    test('simple call without waiting', () async {
      expect(impl.throwExceptionAfter(0), throwsException);

      await Future.delayed(Duration(seconds: 1));

      var count = impl.count();
      expect(count, 1);
    });
    test('simple call', () async {
      expect(impl.throwExceptionAfter(1), throwsException);

      var count = impl.count();
      expect(count, 1);
    });
    test('simple call with completion', () async {
      expect(impl.throwExceptionAfter(1), completion(throwsException));

      var count = impl.count();
      expect(count, 1);
    });
    test('call as a function', () async {
      expect(() => impl.throwExceptionAfter(1), throwsException);

      var count = impl.count();
      expect(count, 1);
    });

    test('call as a explicit async function with await', () async {
      expect(() async {
        await impl.throwExceptionAfter(1);
      }, throwsException);

      var count = impl.count();
      expect(count, 1);
    });

    test('simpel call expectLater', () async {
      expectLater(impl.throwExceptionAfter(1), throwsException);

      var count = impl.count();
      expect(count, 1);
    });
  });
}
