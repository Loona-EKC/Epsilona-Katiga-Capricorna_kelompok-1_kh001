import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../dummy/dummy_data.dart';

class PharmacyMedicineDetailScreen extends StatelessWidget {
  const PharmacyMedicineDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final medicine = DummyData.medicines[0];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail Obat'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryRed,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(medicine),
            const SizedBox(height: 24),
            _buildSectionTitle('Informasi Obat'),
            const SizedBox(height: 12),
            _buildInfoCard(medicine),
            const SizedBox(height: 24),
            if (medicine.isCompound) _buildCompositionSection(medicine),
            if (medicine.isCompound) const SizedBox(height: 24),
            _buildExpiryWarning(medicine),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(dynamic medicine) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.primaryRed.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.medication,
                size: 40,
                color: AppTheme.primaryRed,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicine.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    medicine.dosage,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.textLight,
                    ),
                  ),
                ],
              ),
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

  Widget _buildInfoCard(dynamic medicine) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('Jenis Obat', medicine.type),
            const SizedBox(height: 8),
            _buildInfoRow('Dosis', medicine.dosage),
            const SizedBox(height: 8),
            _buildInfoRow('Kegunaan', medicine.usage),
            const SizedBox(height: 8),
            _buildInfoRow('Aturan Minum', medicine.consumptionRule),
            const SizedBox(height: 8),
            _buildInfoRow('Frekuensi', '${medicine.frequency}x sehari'),
            const SizedBox(height: 8),
            _buildInfoRow('Jam Minum', medicine.times.join(', ')),
            const SizedBox(height: 8),
            _buildInfoRow('Durasi', '${medicine.duration} hari'),
            const SizedBox(height: 8),
            _buildInfoRow('Tanggal Kadaluwarsa', medicine.expiryDate),
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
          width: 140,
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

  Widget _buildCompositionSection(dynamic medicine) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Obat Racikan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Komposisi:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                ...medicine.composition!.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      const Text('• '),
                      Text(item),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpiryWarning(dynamic medicine) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.warning, color: Colors.orange.shade700),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Perhatian: Obat akan kadaluwarsa pada ${medicine.expiryDate}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.orange.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
