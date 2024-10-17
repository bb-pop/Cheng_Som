import 'package:flutter/material.dart';
import '../service/auth_service.dart'; // อย่าลืมนำเข้าฟังก์ชัน logout ที่คุณสร้างไว้
import '../screens/repair_report_list_screen.dart'; // เพิ่มการนำเข้า

class HelloMemberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Dashboard'),
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
            Text('Hello Member', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20), // เพิ่มช่องว่าง
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RepairReportListScreen()),
                ); // นำไปยังหน้ารายการแจ้งซ่อม
              },
              child: Text('View Repair Reports'),
            ),
            SizedBox(height: 20), // เพิ่มช่องว่าง
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