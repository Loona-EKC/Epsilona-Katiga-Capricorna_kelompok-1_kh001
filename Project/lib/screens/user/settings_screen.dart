import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/routes/app_routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryRed,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSection('Akun'),
          _buildSettingItem(
            icon: Icons.person,
            title: 'Edit Profil',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.lock,
            title: 'Ubah Password',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          _buildSection('Notifikasi'),
          _buildSettingItem(
            icon: Icons.notifications,
            title: 'Pengingat Obat',
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: AppTheme.primaryRed,
            ),
          ),
          _buildSettingItem(
            icon: Icons.email,
            title: 'Notifikasi Email',
            trailing: Switch(
              value: false,
              onChanged: (value) {},
              activeColor: AppTheme.primaryRed,
            ),
          ),
          const SizedBox(height: 24),
          _buildSection('Lainnya'),
          _buildSettingItem(
            icon: Icons.info,
            title: 'Tentang MediTrack',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.description,
            title: 'Kebijakan Privasi',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.contact_support,
            title: 'Bantuan',
            onTap: () {},
          ),
          const SizedBox(height: 24),
          _buildLogoutButton(context),
        ],
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppTheme.primaryRed,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primaryRed),
        title: Text(title),
        trailing: trailing ?? const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.logout, color: AppTheme.statusRed),
        title: const Text(
          'Keluar',
          style: TextStyle(color: AppTheme.statusRed),
        ),
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.login,
            (route) => false,
          );
        },
      ),
    );
  }
}
