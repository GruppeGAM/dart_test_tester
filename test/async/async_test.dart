import 'package:test_tester/async/async.dart';

import 'async_testcase.dart';

void main() {

  _ImplAsyncTestcase().validate();
}

class _ImplAsyncTestcase extends AsyncTestcase {
  @override
  Future<Async> instance() async {
    var implAsync = ImplAsync();
    return Future.value(implAsync);
  }
}