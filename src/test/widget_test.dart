import 'package:flutter_test/flutter_test.dart';
import 'package:paperless/app.dart';

void main() {
  testWidgets('App builds', (WidgetTester tester) async {
    await tester.pumpWidget(const PaperlessApp());
    expect(find.byType(PaperlessApp), findsOneWidget);
  });
}
