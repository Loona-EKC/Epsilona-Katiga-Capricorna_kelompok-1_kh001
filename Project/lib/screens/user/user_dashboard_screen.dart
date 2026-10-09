import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../../dummy/dummy_data.dart';
import '../../widgets/status_card.dart';
import '../../widgets/app_button.dart';
import '../../widgets/user_bottom_navigation.dart';

class UserDashboardScreen extends StatefulWidget {
  const UserDashboardScreen({super.key});

  @override
  State<UserDashboardScreen> createState() => _UserDashboardScreenState();
}

class _UserDashboardScreenState extends State<UserDashboardScreen> {
  bool _hasPrescription = false;
  bool _hasConsultation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryRed,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildHomeContent(),
      bottomNavigationBar: const UserBottomNavigation(currentIndex: 0),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGreeting(),
          const SizedBox(height: 24),
          _buildSubmissionStatus(),
          const SizedBox(height: 24),
          _buildPrescriptionSection(),
          const SizedBox(height: 24),
          _buildConsultationSection(),
          const SizedBox(height: 24),
          AppButton(
            text: 'Kirim untuk Validasi',
            onPressed: () {},
          ),
          const SizedBox(height: 24),
          _buildTodayMedicines(),
          const SizedBox(height: 24),
          _buildDisclaimer(),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Halo, ${DummyData.currentUser.name.split(' ')[0]} 👋',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Semoga hari kamu sehat selalu.',
          style: TextStyle(
            fontSize: 14,
            color: AppTheme.textLight,
          ),
        ),
      ],
    );
  }

  Widget _buildSubmissionStatus() {
    return StatusCard(
      title: 'Pengajuan #MT-001',
      subtitle: 'Diajukan: 07 Oktober 2026',
      status: '⏳',
      icon: Icons.description,
    );
  }

  Widget _buildPrescriptionSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Apakah ada resep?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: _hasPrescription,
                  onChanged: (value) {
                    setState(() {
                      _hasPrescription = value!;
                    });
                  },
                  activeColor: AppTheme.primaryRed,
                ),
                const Text('Ya'),
                const SizedBox(width: 24),
                Radio<bool>(
                  value: false,
                  groupValue: _hasPrescription,
                  onChanged: (value) {
                    setState(() {
                      _hasPrescription = value!;
                    });
                  },
                  activeColor: AppTheme.primaryRed,
                ),
                const Text('Tidak'),
              ],
            ),
            if (_hasPrescription) ...[
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.textLight.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 48,
                      color: AppTheme.primaryRed,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Upload Resep',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Foto atau PDF',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildConsultationSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Apakah sudah konsultasi?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: _hasConsultation,
                  onChanged: (value) {
                    setState(() {
                      _hasConsultation = value!;
                    });
                  },
                  activeColor: AppTheme.primaryRed,
                ),
                const Text('Ya'),
                const SizedBox(width: 24),
                Radio<bool>(
                  value: false,
                  groupValue: _hasConsultation,
                  onChanged: (value) {
                    setState(() {
                      _hasConsultation = value!;
                    });
                  },
                  activeColor: AppTheme.primaryRed,
                ),
                const Text('Tidak'),
              ],
            ),
            if (_hasConsultation) ...[
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.textLight.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 48,
                      color: AppTheme.primaryRed,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Upload Bukti Konsultasi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Foto atau PDF',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTodayMedicines() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Obat Hari Ini',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _buildMedicineItem('Paracetamol', '500 mg', '07:00', 'Sudah Diminum'),
        const SizedBox(height: 8),
        _buildMedicineItem('Amoxicillin', '500 mg', '13:00', 'Belum'),
        const SizedBox(height: 8),
        _buildMedicineItem('Paracetamol', '500 mg', '19:00', 'Belum'),
      ],
    );
  }

  Widget _buildMedicineItem(String name, String dosage, String time, String status) {
    Color statusColor = status == 'Sudah Diminum' 
        ? AppTheme.statusGreen 
        : AppTheme.statusYellow;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.primaryRed.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.medication,
                color: AppTheme.primaryRed,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    dosage,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.textLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              time,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.textLight,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisclaimer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.amber.shade700),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              AppConstants.disclaimer,
              style: TextStyle(
                fontSize: 12,
                color: Colors.amber.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }

}
