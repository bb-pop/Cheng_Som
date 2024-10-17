import 'package:pocketbase/pocketbase.dart';
import '../models/repairman.dart';

class RepairmanService {
  final PocketBase pb = PocketBase('http://127.0.0.1:8090');

  Future<List<Repairman>> getAllRepairmen() async {
    // ดึงข้อมูลจากคอลเล็กชัน repairmans
    final response = await pb.collection('repairmans').getFullList();
    
    // แปลงเป็น List<Repairman>
    return response.map((e) {
      // ตรวจสอบว่าข้อมูลอยู่ในรูปแบบ RecordModel หรือไม่
      if (e is RecordModel) {
        return Repairman.fromJson(e.toJson()); // ใช้ toJson() เพื่อแปลงให้ถูกต้อง
      }
      throw Exception('Invalid data format'); // เพิ่มการตรวจสอบสำหรับข้อมูลที่ไม่ถูกต้อง
    }).toList();
  }

  Future<void> addRepairman({
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    await pb.collection('repairmans').create(body: {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
    });
  }

  Future<void> updateRepairman({
    required String id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    await pb.collection('repairmans').update(id, body: {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
    });
  }

  Future<void> deleteRepairman(String id) async {
    await pb.collection('repairmans').delete(id); // ใช้คำสั่ง delete เพื่อลบระเบียน
  }
  
}
