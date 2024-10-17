class Repairman {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;

  Repairman({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  factory Repairman.fromJson(Map<String, dynamic> json) {
    return Repairman(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
    );
  }
}
