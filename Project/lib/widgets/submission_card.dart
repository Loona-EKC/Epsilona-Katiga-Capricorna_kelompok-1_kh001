import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import '../models/submission_model.dart';

class SubmissionCard extends StatelessWidget {
  final SubmissionModel submission;
  final VoidCallback onTap;

  const SubmissionCard({
    super.key,
    required this.submission,
    required this.onTap,
  });

  Color getStatusColor() {
    if (submission.status.startsWith('Menunggu Validasi')) {
      return AppTheme.statusYellow;
    }

    switch (submission.status) {
      case 'Aman':
        return AppTheme.statusGreen;
      case '⏳':
        return AppTheme.statusYellow;
      case 'Tidak Aman':
      case 'Perlu Revisi':
        return AppTheme.statusRed;
      default:
        return AppTheme.statusGray;
    }
  }

  bool get isPending =>
      submission.status == '⏳' ||
      submission.status.startsWith('Menunggu Validasi');

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pengajuan #${submission.id}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: getStatusColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: isPending
                        ? Tooltip(
                            message: submission.status,
                            child: Semantics(
                              label: submission.status,
                              child: Icon(
                                Icons.hourglass_top,
                                size: 18,
                                color: getStatusColor(),
                              ),
                            ),
                          )
                        : Text(
                            submission.status,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: getStatusColor(),
                            ),
                          ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                submission.userName,
                style: TextStyle(fontSize: 14, color: AppTheme.textLight),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppTheme.textLight,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    submission.submissionDate,
                    style: TextStyle(fontSize: 13, color: AppTheme.textLight),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
