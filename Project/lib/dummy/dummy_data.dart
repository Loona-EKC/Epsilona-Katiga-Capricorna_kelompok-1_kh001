import '../models/user_model.dart';
import '../models/medicine_model.dart';
import '../models/submission_model.dart';

class DummyData {
  static final UserModel currentUser = UserModel(
    id: 'user001',
    name: 'Epsilona Katiga Capricorna',
    email: 'epsilona@example.com',
    phone: '081234567890',
    dateOfBirth: '1995-05-15',
    gender: 'Perempuan',
    role: 'user',
    allergies: 'Penisilin',
  );

  static final UserModel adminUser = UserModel(
    id: 'admin001',
    name: 'Admin MediTrack',
    email: 'admin@meditrack.com',
    phone: '081111111111',
    dateOfBirth: '1990-01-01',
    gender: 'Laki-laki',
    role: 'admin',
  );

  static final UserModel doctorUser = UserModel(
    id: 'doctor001',
    name: 'Dr. Budi Santoso',
    email: 'drbudi@meditrack.com',
    phone: '082222222222',
    dateOfBirth: '1980-03-20',
    gender: 'Laki-laki',
    role: 'doctor',
  );

  static final UserModel pharmacyUser = UserModel(
    id: 'pharmacy001',
    name: 'Apoteker Siti',
    email: 'siti@meditrack.com',
    phone: '083333333333',
    dateOfBirth: '1985-07-10',
    gender: 'Perempuan',
    role: 'pharmacy',
  );

  static final List<MedicineModel> medicines = [
    MedicineModel(
      id: 'med001',
      name: 'Paracetamol',
      type: 'Tablet',
      dosage: '500 mg',
      usage: 'Demam dan nyeri',
      consumptionRule: 'Sesudah Makan',
      frequency: 3,
      times: ['07:00', '13:00', '19:00'],
      duration: 5,
      startDate: '2026-10-07',
      endDate: '2026-10-12',
      expiryDate: '2028-12-31',
      sideEffects: 'Mual, pusing ringan',
      isActive: true,
    ),
    MedicineModel(
      id: 'med002',
      name: 'Amoxicillin',
      type: 'Kapsul',
      dosage: '500 mg',
      usage: 'Antibiotik untuk infeksi',
      consumptionRule: 'Sebelum Makan',
      frequency: 3,
      times: ['08:00', '14:00', '20:00'],
      duration: 7,
      startDate: '2026-10-07',
      endDate: '2026-10-14',
      expiryDate: '2027-06-30',
      sideEffects: 'Diare, ruam kulit',
      isActive: true,
    ),
    MedicineModel(
      id: 'med003',
      name: 'Vitamin C',
      type: 'Tablet',
      dosage: '500 mg',
      usage: 'Suplemen daya tahan tubuh',
      consumptionRule: 'Sesudah Makan',
      frequency: 1,
      times: ['09:00'],
      duration: 30,
      startDate: '2026-10-01',
      endDate: '2026-10-31',
      expiryDate: '2029-01-15',
      sideEffects: null,
      isActive: true,
    ),
    MedicineModel(
      id: 'med004',
      name: 'Obat Batuk Racikan',
      type: 'Racikan',
      dosage: '1 sendok makan',
      usage: 'Batuk kering',
      consumptionRule: 'Sesudah Makan',
      frequency: 3,
      times: ['08:00', '14:00', '21:00'],
      duration: 5,
      startDate: '2026-10-05',
      endDate: '2026-10-10',
      expiryDate: '2026-11-30',
      sideEffects: 'Mengantuk',
      isCompound: true,
      composition: ['Paracetamol', 'Caffeine', 'Dextromethorphan'],
      isActive: true,
    ),
  ];

  static final List<SubmissionModel> submissions = [
    SubmissionModel(
      id: 'MT-001',
      userId: 'user001',
      userName: 'Epsilona Katiga Capricorna',
      userEmail: 'epsilona@example.com',
      userPhone: '081234567890',
      userDateOfBirth: '1995-05-15',
      userGender: 'Perempuan',
      prescriptionUrl: 'dummy_prescription.jpg',
      consultationUrl: 'dummy_consultation.jpg',
      status: 'Menunggu Validasi Admin',
      submissionDate: '2026-10-07',
      assignedDoctor: null,
    ),
    SubmissionModel(
      id: 'MT-002',
      userId: 'user001',
      userName: 'Epsilona Katiga Capricorna',
      userEmail: 'epsilona@example.com',
      userPhone: '081234567890',
      userDateOfBirth: '1995-05-15',
      userGender: 'Perempuan',
      prescriptionUrl: 'dummy_prescription2.jpg',
      consultationUrl: null,
      status: 'Aman',
      submissionDate: '2026-09-25',
      assignedDoctor: 'Dr. Budi Santoso',
      doctorNote: 'Resep aman, dapat diproses',
    ),
    SubmissionModel(
      id: 'MT-003',
      userId: 'user002',
      userName: 'John Doe',
      userEmail: 'john@example.com',
      userPhone: '081234567891',
      userDateOfBirth: '1990-08-20',
      userGender: 'Laki-laki',
      prescriptionUrl: 'dummy_prescription3.jpg',
      consultationUrl: 'dummy_consultation3.jpg',
      status: 'Perlu Revisi',
      submissionDate: '2026-09-20',
      assignedDoctor: 'Dr. Budi Santoso',
      doctorNote: 'Mohon lengkapi bukti konsultasi',
    ),
  ];

  static final Map<String, Map<String, String>> medicineSchedule = {
    '2026-10-07': {
      '07:00': 'Paracetamol 500 mg - Belum',
      '13:00': 'Amoxicillin 500 mg - Sudah Diminum',
      '19:00': 'Paracetamol 500 mg - Belum',
    },
    '2026-10-08': {
      '07:00': 'Paracetamol 500 mg - Terlewat',
      '13:00': 'Amoxicillin 500 mg - Sudah Diminum',
      '19:00': 'Paracetamol 500 mg - Belum',
    },
  };

  static final Map<String, int> adherenceStats = {
    'taken': 18,
    'missed': 3,
    'pending': 2,
    'total': 23,
    'percentage': 85,
  };
}
