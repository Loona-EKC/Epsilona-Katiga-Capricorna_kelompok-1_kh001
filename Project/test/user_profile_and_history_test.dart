import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kesehatan/core/routes/app_routes.dart';
import 'package:kesehatan/dummy/dummy_data.dart';
import 'package:kesehatan/screens/user/profile_screen.dart';
import 'package:kesehatan/widgets/submission_card.dart';

void main() {
  testWidgets('pending submission shows a compact hourglass status', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SubmissionCard(
            submission: DummyData.submissions.first,
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.text('Menunggu Validasi Admin'), findsNothing);
    expect(find.byIcon(Icons.hourglass_top), findsOneWidget);
    expect(
      tester.widget<Tooltip>(find.byType(Tooltip)).message,
      'Menunggu Validasi Admin',
    );
  });

  testWidgets('profile logout returns to login and clears user screens', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: const ProfileScreen(),
        routes: {
          AppRoutes.login: (_) =>
              const Scaffold(body: Center(child: Text('Masuk ke akun Anda'))),
        },
      ),
    );

    await tester.ensureVisible(find.text('Keluar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Keluar'));
    await tester.pumpAndSettle();

    expect(find.text('Masuk ke akun Anda'), findsOneWidget);
    expect(find.text('Profil'), findsNothing);
  });
}
