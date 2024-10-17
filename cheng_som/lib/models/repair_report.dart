class RepairReport {
  final String id;
  final DateTime timeForRepairs;
  final String title;
  final String description;
  final String roomNumber;
  final String phoneNumber;
  final String firstName;
  final String responsibility;
  final String status;

  RepairReport({
    required this.id,
    required this.timeForRepairs,
    required this.title,
    required this.description,
    required this.roomNumber,
    required this.phoneNumber,
    required this.firstName,
    required this.responsibility,
    required this.status,
  });

  factory RepairReport.fromJson(Map<String, dynamic> json) {
    return RepairReport(
      id: json['id'] ?? '',
      timeForRepairs: DateTime.parse(json['time_for_repairs']),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      roomNumber: json['room_number'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      firstName: json['first_name'] ?? '',
      responsibility: json['responsibility'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
