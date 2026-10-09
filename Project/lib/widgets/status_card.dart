import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final IconData? icon;

  const StatusCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    this.icon,
  });

  Color getStatusColor() {
    switch (status) {
      case 'Aman':
      case 'Sudah Diminum':
        return AppTheme.statusGreen;
      case '⏳':
        return AppTheme.statusYellow;
      case 'Tidak Aman':
      case 'Perlu Revisi':
      case 'Terlewat':
        return AppTheme.statusRed;
      default:
        return AppTheme.statusGray;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 40, color: AppTheme.primaryRed),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: getStatusColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: getStatusColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
