import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../dummy/dummy_data.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';

class DoctorSubmissionDetailScreen extends StatefulWidget {
  const DoctorSubmissionDetailScreen({super.key});

  @override
  State<DoctorSubmissionDetailScreen> createState() => _DoctorSubmissionDetailScreenState();
}

class _DoctorSubmissionDetailScreenState extends State<DoctorSubmissionDetailScreen> {
  String _decision = '';
  final _noteController = TextEditingController();

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
            _buildSectionTitle('Data Pasien'),
            const SizedBox(height: 12),
            _buildInfoCard(submission),
            const SizedBox(height: 24),
            _buildSectionTitle('Dokumen'),
            const SizedBox(height: 12),
            _buildDocumentCard('Resep', submission.prescriptionUrl),
            const SizedBox(height: 12),
            _buildDocumentCard('Bukti Konsultasi', submission.consultationUrl),
            const SizedBox(height: 24),
            _buildSectionTitle('Keputusan'),
            const SizedBox(height: 12),
            _buildDecisionOptions(),
            const SizedBox(height: 24),
            AppTextField(
              label: 'Catatan Dokter',
              hintText: 'Tulis catatan...',
              controller: _noteController,
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            AppButton(
              text: 'Simpan Keputusan',
              onPressed: _decision.isNotEmpty ? () {} : () {},
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

  Widget _buildDecisionOptions() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<String>(
              title: const Text('Aman'),
              value: 'Aman',
              groupValue: _decision,
              onChanged: (value) {
                setState(() {
                  _decision = value!;
                });
              },
              activeColor: AppTheme.statusGreen,
            ),
            RadioListTile<String>(
              title: const Text('Tidak Aman'),
              value: 'Tidak Aman',
              groupValue: _decision,
              onChanged: (value) {
                setState(() {
                  _decision = value!;
                });
              },
              activeColor: AppTheme.statusRed,
            ),
            RadioListTile<String>(
              title: const Text('Perlu Revisi'),
              value: 'Perlu Revisi',
              groupValue: _decision,
              onChanged: (value) {
                setState(() {
                  _decision = value!;
                });
              },
              activeColor: AppTheme.statusYellow,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }
}
