class Member {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String roomNumber;

  Member({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.roomNumber,
  });

  // ฟังก์ชันเพื่อสร้าง Member จาก JSON
  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      roomNumber: json['room_number'],
    );
  }

  // ฟังก์ชันเพื่อแปลง Member เป็น JSON
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'room_number': roomNumber,
    };
  }
}
