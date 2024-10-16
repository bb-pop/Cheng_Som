import 'package:flutter/material.dart';
import '../service/auth_service.dart'; // อย่าลืมนำเข้าฟังก์ชัน logout ที่คุณสร้างไว้

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
