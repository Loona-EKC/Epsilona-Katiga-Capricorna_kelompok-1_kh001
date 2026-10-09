import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/routes/app_routes.dart';
import '../../dummy/dummy_data.dart';
import '../../widgets/medicine_card.dart';
import '../../widgets/user_bottom_navigation.dart';

class MedicineListScreen extends StatefulWidget {
  const MedicineListScreen({super.key});

  @override
  State<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  String _filter = 'Semua';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Obat Saya'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryRed,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildFilterChips(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: DummyData.medicines.length,
              itemBuilder: (context, index) {
                final medicine = DummyData.medicines[index];
                if (_filter == 'Semua' || 
                    (_filter == 'Aktif' && medicine.isActive) ||
                    (_filter == 'Selesai' && !medicine.isActive)) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: MedicineCard(
                      medicine: medicine,
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.medicineDetail);
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const UserBottomNavigation(currentIndex: 1),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Cari obat...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: ['Semua', 'Aktif', 'Selesai'].map((filter) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(filter),
              selected: _filter == filter,
              onSelected: (selected) {
                setState(() {
                  _filter = filter;
                });
              },
              selectedColor: AppTheme.primaryRed.withOpacity(0.2),
              checkmarkColor: AppTheme.primaryRed,
            ),
          );
        }).toList(),
      ),
    );
  }
}
