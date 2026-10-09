import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kesehatan/screens/user/medicine_calendar_screen.dart';

void main() {
  testWidgets('medicine calendar scrolls on a compact device screen', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 780);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: MedicineCalendarScreen()));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byType(SingleChildScrollView), findsOneWidget);

    await tester.ensureVisible(find.text('Jadwal Obat'));
    await tester.pumpAndSettle();

    expect(find.text('Jadwal Obat'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
