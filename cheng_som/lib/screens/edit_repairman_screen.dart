import 'package:flutter/material.dart';
import '../models/repairman.dart';
import '../service/repairman_service.dart';

class EditRepairmanScreen extends StatefulWidget {
  final Repairman repairman;

  EditRepairmanScreen({required this.repairman});

  @override
  _EditRepairmanScreenState createState() => _EditRepairmanScreenState();
}

class _EditRepairmanScreenState extends State<EditRepairmanScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstNameController.text = widget.repairman.firstName;
    lastNameController.text = widget.repairman.lastName;
    phoneNumberController.text = widget.repairman.phoneNumber;
  }

  Future<void> updateRepairman() async {
    await RepairmanService().updateRepairman(
      id: widget.repairman.id,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phoneNumber: phoneNumberController.text,
    );

    Navigator.pop(context); // กลับไปหน้าก่อนหน้า
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Repairman')),
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
              onPressed: updateRepairman,
              child: Text('Update Repairman'),
            ),
          ],
        ),
      ),
    );
  }
}
