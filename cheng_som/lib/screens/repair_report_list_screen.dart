import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../service/repair_report_service.dart';
import '../service/member_service.dart';
import '../models/repair_report.dart';
import 'add_repair_report_screen.dart';
import 'edit_repair_report_screen.dart'; // นำเข้าไฟล์แก้ไขรายงานแจ้งซ่อม

class RepairReportListScreen extends StatefulWidget {
  @override
  _RepairReportListScreenState createState() => _RepairReportListScreenState();
}

class _RepairReportListScreenState extends State<RepairReportListScreen> {
  List<RepairReport> repairReports = [];
  Map<String, String> roomMap = {};

  @override
  void initState() {
    super.initState();
    fetchRepairReports();
    fetchMembers();
  }

  Future<void> fetchRepairReports() async {
    repairReports = await RepairReportService().getAllRepairReports();
    setState(() {});
  }

  Future<void> fetchMembers() async {
    final members = await MemberService().getAllMembers();
    setState(() {
      roomMap = {for (var member in members) member.id: member.roomNumber};
    });
  }

  Future<void> deleteRepairReport(String id) async {
    await RepairReportService().deleteRepairReport(id);
    fetchRepairReports(); // อัปเดตรายการหลังจากลบ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repair Reports'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddRepairReportScreen()),
              );
            },
          ),
        ],
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
                    'เลขห้อง: ${report.roomNumber ?? 'Unknown Room'}\n'
                    'เวลาที่เข้าซ่อม: ${DateFormat('dd/MM/yyyy').format(report.timeForRepairs)} '
                    '${DateFormat('HH:mm น.').format(report.timeForRepairs)}\n'
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
                              builder: (context) => EditRepairReportScreen(report: report),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteRepairReport(report.id); // เรียกฟังก์ชันลบ
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}