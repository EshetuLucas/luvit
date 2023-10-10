import 'package:flutter_test/flutter_test.dart';
import 'package:luvit/app/app.locator.dart';
import 'package:luvit/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
