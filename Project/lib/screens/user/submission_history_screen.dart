import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/routes/app_routes.dart';
import '../../dummy/dummy_data.dart';
import '../../widgets/submission_card.dart';
import '../../widgets/user_bottom_navigation.dart';

class SubmissionHistoryScreen extends StatelessWidget {
  const SubmissionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Riwayat Pengajuan'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryRed,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: DummyData.submissions.length,
        itemBuilder: (context, index) {
          final submission = DummyData.submissions[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SubmissionCard(
              submission: submission,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.submissionDetail);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: const UserBottomNavigation(currentIndex: 3),
    );
  }
}
