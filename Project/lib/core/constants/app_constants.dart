class AppConstants {
  static const String appName = 'MediTrack';
  static const String appTagline = 'Manajemen Resep & Pengingat Obat';
  
  static const String disclaimer = 
      'MediTrack hanya membantu administrasi resep, pencatatan obat, dan pengingat waktu minum obat. '
      'Aplikasi ini bukan pengganti diagnosis, konsultasi, atau saran medis dari tenaga kesehatan.';
  
  static const List<String> userRoles = ['user', 'admin', 'doctor', 'pharmacy'];
  
  static const List<String> medicineTypes = ['Tablet', 'Kapsul', 'Sirup', 'Racikan'];
  static const List<String> consumptionRules = ['Sebelum Makan', 'Sesudah Makan'];
  
  static const List<String> submissionStatuses = [
    'Menunggu Validasi Admin',
    'Menunggu Validasi Dokter',
    'Aman',
    'Tidak Aman',
    'Perlu Revisi',
    'Selesai',
  ];
  
  static const List<String> medicineStatuses = [
    'Belum',
    'Sudah Diminum',
    'Terlewat',
  ];
}
