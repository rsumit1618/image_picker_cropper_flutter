
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/home_page.dart';
import 'package:flutter_test_app/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    "Verify that User clicks on Camera button and camera permission is opened "
        "and tapping on allow camera is opened, and user is able to click the image",
        (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      await tester.tap(find.widgetWithText(MaterialButton, 'Camera'));
      await tester.pump(new Duration(seconds: 20));

      expect(find.byType(HomePage), findsOneWidget);
    },
  );


  testWidgets(
    "Verify that user taps on Gallery button, gallery permission dialog is shown, and tapping on allow gallery is opened"
        "user is able to select an image",
        (WidgetTester tester) async {
            await tester.pumpWidget(MyApp());
            await tester.tap(find.widgetWithText(MaterialButton, 'Gallery'));
            await tester.pump(new Duration(seconds: 20));

            expect(find.byType(HomePage), findsOneWidget);
    },


  );

  testWidgets("Verify that user is able to tap on Contacts permission button,"
      "Permisson dialog is opened, user manually taps on allow and ten user lands on home page",
      (WidgetTester tester) async {
        await tester.pumpWidget(MyApp()) ;
        await tester.tap(find.widgetWithText(MaterialButton, 'Contact Permission'));

        await tester.pump(new Duration(seconds: 20));

        expect(find.byType(HomePage), findsOneWidget);
  });
}