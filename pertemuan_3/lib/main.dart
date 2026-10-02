import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kartu Mahasiswa',
      home: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Latar belakang warna pastel
      backgroundColor: const Color(0xFFFFE5EC),
      // Kartu diposisikan di tengah layar
      body: const Center(
        child: KartuMahasiswa(
          nama: "Epsilona Katiga Capricorna",              // ganti dengan nama Anda
          nim: "20230801345",              // ganti dengan NIM Anda
          programStudi: "Teknik Informatika", // ganti dengan prodi Anda
        ),
      ),
    );
  }
}

class KartuMahasiswa extends StatelessWidget {
  final String nama;
  final String nim;
  final String programStudi;

  const KartuMahasiswa({
    super.key,
    required this.nama,
    required this.nim,
    required this.programStudi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "KARTU MAHASISWA",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const Text("Nama", style: TextStyle(color: Colors.grey)),
          Text(nama, style: const TextStyle(fontSize: 18)),
          const Divider(),
          const Text("NIM", style: TextStyle(color: Colors.grey)),
          Text(nim, style: const TextStyle(fontSize: 18)),
          const Divider(),
          const Text("Program Studi", style: TextStyle(color: Colors.grey)),
          Text(programStudi, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}