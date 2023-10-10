import 'package:flutter_test/flutter_test.dart';
import 'package:luvit/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('BrowseViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

