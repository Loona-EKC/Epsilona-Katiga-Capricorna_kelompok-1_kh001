import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../dummy/dummy_data.dart';
import '../../widgets/app_button.dart';

class AdminSubmissionDetailScreen extends StatelessWidget {
  const AdminSubmissionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final submission = DummyData.submissions[0];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Pengajuan'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryRed,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Informasi Pasien'),
            const SizedBox(height: 12),
            _buildInfoCard(submission),
            const SizedBox(height: 24),
            _buildSectionTitle('Dokumen'),
            const SizedBox(height: 12),
            _buildDocumentCard('Resep', submission.prescriptionUrl),
            const SizedBox(height: 12),
            _buildDocumentCard('Bukti Konsultasi', submission.consultationUrl),
            const SizedBox(height: 24),
            _buildSectionTitle('Pilih Dokter'),
            const SizedBox(height: 12),
            _buildDoctorDropdown(),
            const SizedBox(height: 24),
            AppButton(
              text: 'Teruskan ke Dokter',
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppTheme.statusYellow),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Minta Revisi',
                      style: TextStyle(color: AppTheme.statusYellow),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppTheme.statusRed),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Tolak',
                      style: TextStyle(color: AppTheme.statusRed),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInfoCard(dynamic submission) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Nama', submission.userName),
            const SizedBox(height: 8),
            _buildInfoRow('Email', submission.userEmail),
            const SizedBox(height: 8),
            _buildInfoRow('Nomor HP', submission.userPhone),
            const SizedBox(height: 8),
            _buildInfoRow('Tanggal Lahir', submission.userDateOfBirth),
            const SizedBox(height: 8),
            _buildInfoRow('Jenis Kelamin', submission.userGender),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textLight,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDocumentCard(String title, String? url) {
    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.primaryRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.description,
                  color: AppTheme.primaryRed,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorDropdown() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          hint: const Text('Pilih Dokter'),
          items: const [
            DropdownMenuItem(
              value: 'dr_budi',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dr. Budi Santoso', style: TextStyle(fontWeight: FontWeight.w500)),
                  Text('Spesialis Penyakit Dalam', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
            DropdownMenuItem(
              value: 'dr_siti',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dr. Siti Aminah', style: TextStyle(fontWeight: FontWeight.w500)),
                  Text('Spesialis Anak', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }
}
