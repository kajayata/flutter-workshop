import 'package:flutter_test/flutter_test.dart';
import 'package:register/main.dart';

void main() {
  testWidgets('App renders login screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that Portal Mahasiswa title and Masuk button are displayed.
    expect(find.text('Portal Mahasiswa'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);
    expect(find.text('Daftar di sini'), findsOneWidget);
  });
}
