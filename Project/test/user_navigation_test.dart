import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kesehatan/core/routes/app_routes.dart';
import 'package:kesehatan/screens/user/medicine_calendar_screen.dart';
import 'package:kesehatan/screens/user/medicine_list_screen.dart';
import 'package:kesehatan/screens/user/profile_screen.dart';
import 'package:kesehatan/screens/user/submission_history_screen.dart';
import 'package:kesehatan/screens/user/user_dashboard_screen.dart';

void main() {
  testWidgets('user can switch tabs without showing a back button', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1000, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: const UserDashboardScreen(),
        routes: {
          AppRoutes.userDashboard: (_) => const UserDashboardScreen(),
          AppRoutes.medicineList: (_) => const MedicineListScreen(),
          AppRoutes.medicineCalendar: (_) => const MedicineCalendarScreen(),
          AppRoutes.submissionHistory: (_) => const SubmissionHistoryScreen(),
          AppRoutes.profile: (_) => const ProfileScreen(),
        },
      ),
    );

    expect(find.byType(BackButton), findsNothing);
    expect(find.text('Coming Soon'), findsNothing);

    await tester.tap(find.text('Obat'));
    await tester.pumpAndSettle();
    expect(find.text('Obat Saya'), findsOneWidget);
    expect(find.byType(BackButton), findsNothing);

    await tester.tap(find.text('Kalender'));
    await tester.pumpAndSettle();
    expect(find.text('Kalender Obat'), findsOneWidget);

    await tester.tap(find.text('Riwayat'));
    await tester.pumpAndSettle();
    expect(find.text('Riwayat Pengajuan'), findsOneWidget);

    await tester.tap(find.text('Profil').first);
    await tester.pumpAndSettle();
    expect(find.text('Email'), findsOneWidget);

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Coming Soon'), findsNothing);
  });
}
