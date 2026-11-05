import 'package:flutter_test/flutter_test.dart';
import 'package:smart_tourism_app/main.dart';

void main() {
  testWidgets('Syria Discover app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const SyriaDiscoverApp());

    expect(find.text('SYRIA DISCOVER'), findsOneWidget);
  });
}