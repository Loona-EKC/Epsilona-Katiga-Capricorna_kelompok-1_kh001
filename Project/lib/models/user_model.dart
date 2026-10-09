class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String dateOfBirth;
  final String gender;
  final String role;
  final String? allergies;
  final String? photoUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.dateOfBirth,
    required this.gender,
    required this.role,
    this.allergies,
    this.photoUrl,
  });
}
