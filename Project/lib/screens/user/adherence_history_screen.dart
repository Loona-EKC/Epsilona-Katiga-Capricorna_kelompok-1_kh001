import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../dummy/dummy_data.dart';

class AdherenceHistoryScreen extends StatelessWidget {
  const AdherenceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = DummyData.adherenceStats;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Riwayat Kepatuhan'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryRed,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPercentageCard(stats['percentage']!),
            const SizedBox(height: 24),
            _buildStatsSection(stats),
            const SizedBox(height: 24),
            _buildHistoryList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPercentageCard(int percentage) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text(
              'Kepatuhan Minum Obat',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '$percentage%',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryRed,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Minggu Ini',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textLight,
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: AppTheme.textLight.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryRed),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(Map<String, int> stats) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Statistik',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildStatRow('Sudah Diminum', stats['taken']!, AppTheme.statusGreen),
            const SizedBox(height: 12),
            _buildStatRow('Terlewat', stats['missed']!, AppTheme.statusRed),
            const SizedBox(height: 12),
            _buildStatRow('Belum', stats['pending']!, AppTheme.statusYellow),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            _buildStatRow('Total', stats['total']!, AppTheme.textDark),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, int value, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Riwayat',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _buildHistoryItem('07 Oktober 2026', '85%'),
        const SizedBox(height: 8),
        _buildHistoryItem('06 Oktober 2026', '100%'),
        const SizedBox(height: 8),
        _buildHistoryItem('05 Oktober 2026', '75%'),
      ],
    );
  }

  Widget _buildHistoryItem(String date, String percentage) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              percentage,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryRed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
