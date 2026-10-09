import 'package:flutter/material.dart';

import '../core/routes/app_routes.dart';
import '../core/theme/app_theme.dart';

class UserBottomNavigation extends StatelessWidget {
  const UserBottomNavigation({
    required this.currentIndex,
    super.key,
  });

  final int currentIndex;

  static const _routes = [
    AppRoutes.userDashboard,
    AppRoutes.medicineList,
    AppRoutes.medicineCalendar,
    AppRoutes.submissionHistory,
    AppRoutes.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == currentIndex) return;
        Navigator.pushReplacementNamed(context, _routes[index]);
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppTheme.primaryRed,
      unselectedItemColor: AppTheme.textLight,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medication),
          label: 'Obat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Kalender',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );
  }
}
