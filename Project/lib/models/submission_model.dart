class SubmissionModel {
  final String id;
  final String userId;
  final String userName;
  final String userEmail;
  final String userPhone;
  final String userDateOfBirth;
  final String userGender;
  final String? prescriptionUrl;
  final String? consultationUrl;
  final String status;
  final String submissionDate;
  final String? assignedDoctor;
  final String? doctorNote;
  final String? adminNote;

  SubmissionModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.userDateOfBirth,
    required this.userGender,
    this.prescriptionUrl,
    this.consultationUrl,
    required this.status,
    required this.submissionDate,
    this.assignedDoctor,
    this.doctorNote,
    this.adminNote,
  });
}
