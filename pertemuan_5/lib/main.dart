import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // GlobalKey untuk validasi form
  final _formKey = GlobalKey<FormState>();

  // Controller untuk setiap input field
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _lokasiController = TextEditingController();
  final TextEditingController _mataKuliahController = TextEditingController();

  // Variabel untuk dropdown Keterangan Kehadiran
  String _selectedStatus = 'Hadir';
  final List<String> _statusOptions = ['Hadir', 'Izin', 'Sakit'];

  @override
  void dispose() {
    // Bersihkan controller saat widget dihancurkan
    _namaController.dispose();
    _nimController.dispose();
    _lokasiController.dispose();
    _mataKuliahController.dispose();
    super.dispose();
  }

  // Fungsi untuk mengirim data dinamis ke Firebase Cloud Firestore
  Future<void> simpanData() async {
    await FirebaseFirestore.instance.collection('praktikum').add({
      'nama': _namaController.text.trim(),
      'nim': _nimController.text.trim(),
      'lokasi': _lokasiController.text.trim(),
      'mata_kuliah': _mataKuliahController.text.trim(),
      'status': _selectedStatus,
      'waktu': FieldValue.serverTimestamp(),
    });
  }

  // Fungsi untuk mengosongkan kembali seluruh field input
  void _resetForm() {
    _formKey.currentState?.reset();
    _namaController.clear();
    _nimController.clear();
    _lokasiController.clear();
    _mataKuliahController.clear();
    setState(() {
      _selectedStatus = 'Hadir';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Praktikum Firebase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // 1. TextFormField Nama
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 2. TextFormField NIM
              TextFormField(
                controller: _nimController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'NIM tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 3. TextFormField Lokasi
              TextFormField(
                controller: _lokasiController,
                decoration: const InputDecoration(
                  labelText: 'Lokasi',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lokasi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 4. TextFormField Mata Kuliah
              TextFormField(
                controller: _mataKuliahController,
                decoration: const InputDecoration(
                  labelText: 'Mata Kuliah',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mata Kuliah tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // 5. Field Keterangan Kehadiran (Dropdown)
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                decoration: const InputDecoration(
                  labelText: 'Keterangan Kehadiran',
                  border: OutlineInputBorder(),
                ),
                items: _statusOptions.map((String status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedStatus = newValue!;
                  });
                },
              ),
              const SizedBox(height: 24),

              // Tombol Simpan
              ElevatedButton(
                onPressed: () async {
                  // 5. Validasi agar data tidak dapat dikirim jika ada field kosong
                  if (_formKey.currentState!.validate()) {
                    try {
                      // Kirim data ke Firestore
                      await simpanData();

                      // 6. Tampilkan notifikasi keberhasilan
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data berhasil dikirim!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }

                      // Kosongkan kembali seluruh field input
                      _resetForm();
                    } catch (e) {
                      // 7. Tampilkan pesan kesalahan jika gagal
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Gagal mengirim data: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Simpan ke Firebase',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}