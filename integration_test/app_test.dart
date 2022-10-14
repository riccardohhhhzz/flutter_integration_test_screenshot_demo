import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:screenshotdemo/main.dart';
import 'package:integration_test/integration_test.dart';

import 'screenshot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    document.getElementById('screenshot')!.innerText =
        "delete window.ImageDecoder";
  });
  group('end-to-end test', () {
    testWidgets('screenshot', (WidgetTester tester) async {
      GlobalKey rootWidgetKey = GlobalKey();
      final app = MyApp(rootWidgetKey: rootWidgetKey);
      runApp(app);
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);

      final Finder fab = find.byTooltip('Increment');
      await tester.tap(fab);
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);

      takeScreenshot('tap1.png', rootWidgetKey);
      await tester.pumpAndSettle();

      await tester.tap(fab);
      await tester.pumpAndSettle();
      expect(find.text('2'), findsOneWidget);

      takeScreenshot('tap2.png', rootWidgetKey);
      await tester.pumpAndSettle();
    });
  });
}
