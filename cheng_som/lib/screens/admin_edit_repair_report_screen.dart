import 'package:flutter/material.dart';
import '../models/repair_report.dart';
import '../models/repairman.dart';
import '../service/repair_report_service.dart';
import '../service/repairman_service.dart';

class AdminEditRepairReportScreen extends StatefulWidget {
  final RepairReport report;

  AdminEditRepairReportScreen({required this.report});

  @override
  _AdminEditRepairReportScreenState createState() => _AdminEditRepairReportScreenState();
}

class _AdminEditRepairReportScreenState extends State<AdminEditRepairReportScreen> {
  final statusOptions = ['รออนุมัติ', 'รอช่างซ่อม', 'เสร็จสิ้น'];
  String? selectedStatus;
  String? selectedRepairmanId;
  List<Repairman> repairmen = [];

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.report.status;
    fetchRepairmen();
  }

  Future<void> fetchRepairmen() async {
    repairmen = await RepairmanService().getAllRepairmen();
    setState(() {});
  }

  Future<void> saveChanges() async {
    if (selectedStatus != null && selectedRepairmanId != null) {
      await RepairReportService().editRepairReportForAdmin(
        id: widget.report.id,
        responsibility: selectedRepairmanId!,
        status: selectedStatus!,
      );
      Navigator.pop(context); // กลับไปหน้าก่อนเมื่อบันทึกสำเร็จ
    } else {
      // แจ้งเตือนว่าต้องเลือกข้อมูลให้ครบ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('กรุณาเลือกช่างและสถานะให้ครบถ้วน')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แก้ไขรายการแจ้งซ่อม (Admin)')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedRepairmanId,
              decoration: InputDecoration(labelText: 'เลือกช่างซ่อม'),
              items: repairmen.map((repairman) {
                return DropdownMenuItem<String>(
                  value: repairman.id,
                  child: Text('${repairman.firstName} ${repairman.lastName}'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRepairmanId = value;
                });
              },
            ),
            DropdownButtonFormField<String>(
              value: selectedStatus,
              decoration: InputDecoration(labelText: 'สถานะ'),
              items: statusOptions.map((status) {
                return DropdownMenuItem<String>(
                  value: status,
                  child: Text(status),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedStatus = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveChanges,
              child: Text('บันทึกการแก้ไข'),
            ),
          ],
        ),
      ),
    );
  }
}
