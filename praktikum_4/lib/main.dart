import 'package:flutter/material.dart';

import 'constans/colors.dart';
import 'theme/app_theme.dart';
import 'widgets/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // 1. Warna background
      appBar: AppBar(
        title: const Text('Design System Demo'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Universitas Esa Unggul',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary, // 2. Warna primary
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Tekan tombol di bawah untuk melihat lokasi kampus.',
              style: TextStyle(
                color: AppColors.secondary, // 3. Warna secondary
              ),
            ),

            const SizedBox(height: 24),

            AppButton(
              label: 'Buka Google Maps',
              icon: Icons.location_on,
              url: 'https://www.google.com/maps/search/?api=1&query=Universitas+Esa+Unggul',
            ),

            const SizedBox(height: 16),

            AppButton(
              label: 'Tes Tombol (Ganti jadi Github)',
              icon: Icons.touch_app,
              url :'https://github.com/Loona-EKC/Epsilona-Katiga-Capricorna_kelompok-1_kh001',
              onPressed: () {
                debugPrint('Tombol berhasil ditekan!');
              },
            ),
          ],
        ),
      ),
    );
  }
}