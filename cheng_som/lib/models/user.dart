class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool isAdmin;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['record']['id'] ?? '',
      email: json['record']['email'] ?? '',
      firstName: json['record']['name'] ?? '',
      lastName: json['record']['name'] ?? '', // คุณอาจต้องปรับเปลี่ยนตามโครงสร้างข้อมูล
      isAdmin: json['record']['is_admin'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'is_admin': isAdmin,
    };
  }
}
