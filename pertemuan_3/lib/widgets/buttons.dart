import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final String? url; //hilangkan "?" jika ingin wajib menambahkan link

  const AppButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.url, //tambahkan require jika ingin wajib menambahkan link
  });

  Future<void> _handlePressed() async {
    if (onPressed != null) {
      final Uri uri = Uri.parse(url!); //hilangkan tanda seru jika wajib
      final bool success = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!success) {
        debugPrint("Gagal membuka link");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: (onPressed != null || url != null) ? _handlePressed : null, //hilangkan || url !=null jika anda ingin wajib masukkan link
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon),
              const SizedBox(width: 8),
            ],
            Text(label),
          ],
        ),
      ),
    );
  }
}
