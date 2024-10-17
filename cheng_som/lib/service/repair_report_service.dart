import 'package:pocketbase/pocketbase.dart';
import '../models/repair_report.dart';

class RepairReportService {
  final PocketBase pb = PocketBase('http://127.0.0.1:8090');

  Future<List<RepairReport>> getAllRepairReports() async {
    final response = await pb.collection('repair_report').getFullList();
    return response.map((e) {
      if (e is RecordModel) {
        return RepairReport.fromJson(e.toJson());
      }
      throw Exception('Invalid data format');
    }).toList();
  }

  Future<void> addRepairReport({
    required DateTime timeForRepairs,
    required String title,
    required String description,
    required String roomNumber,
    required String phoneNumber,
    required String firstName,
    required String responsibility,
    String status = 'รอปนุมัติ', // ตั้งค่าเป็น "รอปนุมัติ"
  }) async {
    await pb.collection('repair_report').create(body: {
      'time_for_repairs': timeForRepairs.toUtc().toIso8601String(),
      'title': title,
      'description': description,
      'room_number': roomNumber,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'responsibility': responsibility,
      'status': status,
    });
  }

  Future<void> updateRepairReport({
    required String id,
    required DateTime timeForRepairs,
    required String title,
    required String description,
    required String roomNumber,
    required String phoneNumber,
    required String firstName,
    required String responsibility,
    String status = 'รอปนุมัติ',
  }) async {
    await pb.collection('repair_report').update(id, body: {
      'time_for_repairs': timeForRepairs.toUtc().toIso8601String(),
      'title': title,
      'description': description,
      'room_number': roomNumber,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'responsibility': responsibility,
      'status': status,
    });
  }

  Future<void> deleteRepairReport(String id) async {
    await pb.collection('repair_report').delete(id); // ใช้คำสั่ง delete เพื่อลบระเบียน
  }
}
