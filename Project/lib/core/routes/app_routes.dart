import 'package:flutter/material.dart';
import '../../screens/auth/splash_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/register_screen.dart';
import '../../screens/user/user_dashboard_screen.dart';
import '../../screens/admin/admin_dashboard_screen.dart';
import '../../screens/doctor/doctor_dashboard_screen.dart';
import '../../screens/pharmacy/pharmacy_dashboard_screen.dart';
import '../../screens/user/upload_document_screen.dart';
import '../../screens/user/submission_detail_screen.dart';
import '../../screens/user/medicine_list_screen.dart';
import '../../screens/user/medicine_detail_screen.dart';
import '../../screens/user/medicine_calendar_screen.dart';
import '../../screens/user/submission_history_screen.dart';
import '../../screens/user/adherence_history_screen.dart';
import '../../screens/user/profile_screen.dart';
import '../../screens/user/settings_screen.dart';
import '../../screens/admin/admin_submission_list_screen.dart';
import '../../screens/admin/admin_submission_detail_screen.dart';
import '../../screens/doctor/doctor_submission_list_screen.dart';
import '../../screens/doctor/doctor_submission_detail_screen.dart';
import '../../screens/pharmacy/pharmacy_patient_list_screen.dart';
import '../../screens/pharmacy/pharmacy_medicine_form_screen.dart';
import '../../screens/pharmacy/pharmacy_medicine_detail_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String userDashboard = '/user/dashboard';
  static const String adminDashboard = '/admin/dashboard';
  static const String doctorDashboard = '/doctor/dashboard';
  static const String pharmacyDashboard = '/pharmacy/dashboard';
  static const String uploadDocument = '/user/upload-document';
  static const String submissionDetail = '/user/submission-detail';
  static const String medicineList = '/user/medicine-list';
  static const String medicineDetail = '/user/medicine-detail';
  static const String medicineCalendar = '/user/medicine-calendar';
  static const String submissionHistory = '/user/submission-history';
  static const String adherenceHistory = '/user/adherence-history';
  static const String profile = '/user/profile';
  static const String settings = '/user/settings';
  static const String adminSubmissionList = '/admin/submission-list';
  static const String adminSubmissionDetail = '/admin/submission-detail';
  static const String doctorSubmissionList = '/doctor/submission-list';
  static const String doctorSubmissionDetail = '/doctor/submission-detail';
  static const String pharmacyPatientList = '/pharmacy/patient-list';
  static const String pharmacyMedicineForm = '/pharmacy/medicine-form';
  static const String pharmacyMedicineDetail = '/pharmacy/medicine-detail';

  static Map<String, WidgetBuilder> get routes => {
        splash: (context) => const SplashScreen(),
        login: (context) => const LoginScreen(),
        register: (context) => const RegisterScreen(),
        userDashboard: (context) => const UserDashboardScreen(),
        adminDashboard: (context) => const AdminDashboardScreen(),
        doctorDashboard: (context) => const DoctorDashboardScreen(),
        pharmacyDashboard: (context) => const PharmacyDashboardScreen(),
        uploadDocument: (context) => const UploadDocumentScreen(),
        submissionDetail: (context) => const SubmissionDetailScreen(),
        medicineList: (context) => const MedicineListScreen(),
        medicineDetail: (context) => const MedicineDetailScreen(),
        medicineCalendar: (context) => const MedicineCalendarScreen(),
        submissionHistory: (context) => const SubmissionHistoryScreen(),
        adherenceHistory: (context) => const AdherenceHistoryScreen(),
        profile: (context) => const ProfileScreen(),
        settings: (context) => const SettingsScreen(),
        adminSubmissionList: (context) => const AdminSubmissionListScreen(),
        adminSubmissionDetail: (context) => const AdminSubmissionDetailScreen(),
        doctorSubmissionList: (context) => const DoctorSubmissionListScreen(),
        doctorSubmissionDetail: (context) => const DoctorSubmissionDetailScreen(),
        pharmacyPatientList: (context) => const PharmacyPatientListScreen(),
        pharmacyMedicineForm: (context) => const PharmacyMedicineFormScreen(),
        pharmacyMedicineDetail: (context) => const PharmacyMedicineDetailScreen(),
      };
}
