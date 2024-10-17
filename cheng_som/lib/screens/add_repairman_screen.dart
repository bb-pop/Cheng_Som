import 'package:flutter/material.dart';
import '../service/repairman_service.dart';

class AddRepairmanScreen extends StatefulWidget {
  @override
  _AddRepairmanScreenState createState() => _AddRepairmanScreenState();
}

class _AddRepairmanScreenState extends State<AddRepairmanScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> addRepairman() async {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final phoneNumber = phoneNumberController.text;

    if (firstName.isNotEmpty && lastName.isNotEmpty && phoneNumber.isNotEmpty) {
      await RepairmanService().addRepairman(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
      );

      // กลับไปยังหน้ารายชื่อหลังจากเพิ่ม
      Navigator.pop(context);
    } else {
      // แสดงข้อความเตือนถ้าข้อมูลไม่ครบ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Repairman')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addRepairman,
              child: Text('Add Repairman'),
            ),
          ],
        ),
      ),
    );
  }
}
