import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../service/repair_report_service.dart';
import '../models/repair_report.dart';
import 'admin_edit_repair_report_screen.dart'; // นำเข้าไฟล์แก้ไขของ admin

class AdminRepairReportListScreen extends StatefulWidget {
  @override
  _AdminRepairReportListScreenState createState() => _AdminRepairReportListScreenState();
}

class _AdminRepairReportListScreenState extends State<AdminRepairReportListScreen> {
  List<RepairReport> repairReports = [];

  @override
  void initState() {
    super.initState();
    fetchRepairReports();
  }

  Future<void> fetchRepairReports() async {
    repairReports = await RepairReportService().getAllRepairReports();
    setState(() {});
  }

  Future<void> deleteReport(String reportId) async {
    await RepairReportService().deleteRepairReport(reportId);
    fetchRepairReports(); // รีเฟรชหน้าหลังจากลบแล้ว
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin: Repair Reports'),
      ),
      body: repairReports.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: repairReports.length,
              itemBuilder: (context, index) {
                final report = repairReports[index];
                return ListTile(
                  title: Text(report.title),
                  subtitle: Text(
                    'รายละเอียด: ${report.description}\n'
                    'เลขห้อง: ${report.roomNumber}\n'
                    'เวลาที่เข้าซ่อม: ${DateFormat('dd/MM/yyyy').format(report.timeForRepairs)}\n '
                    'สถานะ: ${report.status}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminEditRepairReportScreen(report: report),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteReport(report.id),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
