import 'package:flutter/material.dart';
import '../service/repair_report_service.dart'; // Import service

class AddRepairReportScreen extends StatefulWidget {
  @override
  _AddRepairReportScreenState createState() => _AddRepairReportScreenState();
}

class _AddRepairReportScreenState extends State<AddRepairReportScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final roomNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final firstNameController = TextEditingController();
  DateTime? selectedDate;

  Future<void> addRepairReport() async {
    if (selectedDate == null || titleController.text.isEmpty || descriptionController.text.isEmpty || roomNumberController.text.isEmpty || phoneNumberController.text.isEmpty || firstNameController.text.isEmpty) {
      return; // Validate inputs
    }

    await RepairReportService().addRepairReport(
      timeForRepairs: selectedDate!,
      title: titleController.text,
      description: descriptionController.text,
      roomNumber: roomNumberController.text,
      phoneNumber: phoneNumberController.text,
      firstName: firstNameController.text,
      status: 'รออนุมัติ', 
      responsibility: '',
    );

    Navigator.pop(context); // Close the screen after adding
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Repair Report')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: roomNumberController,
              decoration: InputDecoration(labelText: 'Room Number'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: Text('Select Date'),
            ),
            ElevatedButton(
              onPressed: addRepairReport,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
