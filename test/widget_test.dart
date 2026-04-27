import 'package:flutter_test/flutter_test.dart';
import 'package:worldconnect/main.dart';

void main() {
  testWidgets('App opens with splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const WorldConnectApp());
    await tester.pump();

    // Verify SplashScreen widget is present
    expect(find.text('WorldConnect'), findsOneWidget);
  });
}