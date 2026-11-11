import 'package:flutter_test/flutter_test.dart';
import 'package:crawford_school_app/main.dart';

void main() {
  testWidgets('Crawford Grammar School App Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger frames through splash transition
    await tester.pumpWidget(const CrawfordSchoolApp());
    await tester.pumpAndSettle(const Duration(seconds: 4));

    // Verify app rendered successfully
    expect(find.byType(CrawfordSchoolApp), findsOneWidget);
  });
}
