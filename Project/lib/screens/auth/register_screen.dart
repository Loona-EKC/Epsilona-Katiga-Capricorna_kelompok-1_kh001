import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/routes/app_routes.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _allergiesController = TextEditingController();
  String _gender = 'Laki-laki';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Daftar Akun'),
        backgroundColor: Colors.white,
        foregroundColor: AppTheme.primaryRed,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextField(
                label: 'Nama Lengkap',
                hintText: 'Masukkan nama lengkap',
                controller: _nameController,
              ),
              AppTextField(
                label: 'Email',
                hintText: 'Masukkan email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              AppTextField(
                label: 'Nomor HP',
                hintText: 'Masukkan nomor HP',
                controller: _phoneController,
                keyboardType: TextInputType.phone,
              ),
              AppTextField(
                label: 'Tanggal Lahir',
                hintText: 'Pilih tanggal lahir',
                controller: _dateOfBirthController,
                keyboardType: TextInputType.datetime,
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jenis Kelamin',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'Laki-laki',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value!;
                            });
                          },
                          activeColor: AppTheme.primaryRed,
                        ),
                        const Text('Laki-laki'),
                        const SizedBox(width: 16),
                        Radio<String>(
                          value: 'Perempuan',
                          groupValue: _gender,
                          onChanged: (value) {
                            setState(() {
                              _gender = value!;
                            });
                          },
                          activeColor: AppTheme.primaryRed,
                        ),
                        const Text('Perempuan'),
                      ],
                    ),
                  ],
                ),
              ),
              AppTextField(
                label: 'Password',
                hintText: 'Masukkan password',
                controller: _passwordController,
                obscureText: true,
              ),
              AppTextField(
                label: 'Konfirmasi Password',
                hintText: 'Ulangi password',
                controller: _confirmPasswordController,
                obscureText: true,
              ),
              AppTextField(
                label: 'Alergi (Opsional)',
                hintText: 'Masukkan alergi jika ada',
                controller: _allergiesController,
              ),
              const SizedBox(height: 24),
              AppButton(
                text: 'Daftar',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun? ',
                    style: TextStyle(color: AppTheme.textLight),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        color: AppTheme.primaryRed,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dateOfBirthController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _allergiesController.dispose();
    super.dispose();
  }
}
