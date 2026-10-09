import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';

class PharmacyMedicineFormScreen extends StatefulWidget {
  const PharmacyMedicineFormScreen({super.key});

  @override
  State<PharmacyMedicineFormScreen> createState() => _PharmacyMedicineFormScreenState();
}

class _PharmacyMedicineFormScreenState extends State<PharmacyMedicineFormScreen> {
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  final _usageController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _durationController = TextEditingController();
  final _sideEffectsController = TextEditingController();
  final _compositionController = TextEditingController();
  
  String _type = 'Tablet';
  String _consumptionRule = 'Sesudah Makan';
  bool _isCompound = false;
  int _frequency = 3;
  List<String> _times = ['07:00', '13:00', '19:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Input Obat'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryRed,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              label: 'Nama Obat',
              hintText: 'Masukkan nama obat',
              controller: _nameController,
            ),
            AppTextField(
              label: 'Jenis Obat',
              hintText: 'Pilih jenis obat',
              controller: TextEditingController(text: _type),
              suffixIcon: const Icon(Icons.arrow_drop_down),
            ),
            AppTextField(
              label: 'Dosis',
              hintText: 'Contoh: 500 mg',
              controller: _dosageController,
            ),
            AppTextField(
              label: 'Kegunaan',
              hintText: 'Masukkan kegunaan obat',
              controller: _usageController,
            ),
            AppTextField(
              label: 'Aturan Minum',
              hintText: 'Pilih aturan minum',
              controller: TextEditingController(text: _consumptionRule),
              suffixIcon: const Icon(Icons.arrow_drop_down),
            ),
            _buildFrequencySection(),
            AppTextField(
              label: 'Durasi (Hari)',
              hintText: 'Masukkan durasi',
              controller: _durationController,
              keyboardType: TextInputType.number,
            ),
            AppTextField(
              label: 'Tanggal Kadaluwarsa',
              hintText: 'Pilih tanggal kadaluwarsa',
              controller: _expiryDateController,
              suffixIcon: const Icon(Icons.calendar_today),
            ),
            _buildCompoundSection(),
            AppTextField(
              label: 'Catatan Efek Samping',
              hintText: 'Masukkan efek samping jika ada',
              controller: _sideEffectsController,
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            _buildSchedulePreview(),
            const SizedBox(height: 24),
            AppButton(
              text: 'Simpan Obat',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrequencySection() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Frekuensi per Hari',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Row(
              children: List.generate(4, (index) {
                final freq = index + 1;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text('${freq}x'),
                    selected: _frequency == freq,
                    onSelected: (selected) {
                      setState(() {
                        _frequency = freq;
                        _updateTimes();
                      });
                    },
                    selectedColor: AppTheme.primaryRed.withOpacity(0.2),
                    checkmarkColor: AppTheme.primaryRed,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompoundSection() {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: _isCompound,
                  onChanged: (value) {
                    setState(() {
                      _isCompound = value!;
                    });
                  },
                  activeColor: AppTheme.primaryRed,
                ),
                const Text(
                  'Obat Racikan',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            if (_isCompound) ...[
              const SizedBox(height: 12),
              AppTextField(
                label: 'Komposisi',
                hintText: 'Masukkan komposisi obat',
                controller: _compositionController,
                maxLines: 3,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSchedulePreview() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preview Jadwal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Frekuensi: ${_frequency}x sehari',
              style: TextStyle(fontSize: 14, color: AppTheme.textLight),
            ),
            const SizedBox(height: 12),
            const Text(
              'Jadwal:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            ..._times.map((time) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                time,
                style: const TextStyle(fontSize: 14),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _updateTimes() {
    const baseTimes = ['07:00', '13:00', '19:00', '21:00'];
    setState(() {
      _times = baseTimes.take(_frequency).toList();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _usageController.dispose();
    _expiryDateController.dispose();
    _durationController.dispose();
    _sideEffectsController.dispose();
    _compositionController.dispose();
    super.dispose();
  }
}
