import 'package:cheng_som/screens/admin_repair_report_list_screen.dart';
import 'package:flutter/material.dart';
import '../service/auth_service.dart'; // อย่าลืมนำเข้าฟังก์ชัน logout ที่คุณสร้างไว้
import 'repairman_list_screen.dart'; // นำเข้าไฟล์สำหรับแสดงรายชื่อช่างซ่อม

class HelloAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              AuthService().logoutUser(context); // เรียกฟังก์ชัน logout
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello Admin', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20), // เพิ่มช่องว่าง
            ElevatedButton(
              onPressed: () {
                // นำไปยังหน้ารายชื่อช่างซ่อม
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RepairmanListScreen()),
                );
              },
              child: Text('View Repairman List'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminRepairReportListScreen()),
                );
              },
              child: Text('Manage Repair Reports'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AuthService().logoutUser(context); // เรียกฟังก์ชัน logout
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
