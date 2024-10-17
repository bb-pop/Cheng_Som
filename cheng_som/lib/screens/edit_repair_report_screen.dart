import 'package:flutter/material.dart';
import '../service/repair_report_service.dart';
import '../models/repair_report.dart';

class EditRepairReportScreen extends StatefulWidget {
  final RepairReport report;

  EditRepairReportScreen({required this.report});

  @override
  _EditRepairReportScreenState createState() => _EditRepairReportScreenState();
}

class _EditRepairReportScreenState extends State<EditRepairReportScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.report.title;
    descriptionController.text = widget.report.description;
    selectedDate = widget.report.timeForRepairs; // กำหนดวันที่เริ่มต้น
  }

  Future<void> updateRepairReport() async {
    await RepairReportService().updateRepairReport(
      id: widget.report.id,
      timeForRepairs: selectedDate!,
      title: titleController.text,
      description: descriptionController.text,
      roomNumber: widget.report.roomNumber,
      phoneNumber: widget.report.phoneNumber,
      firstName: widget.report.firstName,
      responsibility: widget.report.responsibility,
      status: widget.report.status,
    );

    Navigator.pop(context); // ปิดหน้าจอหลังจากอัปเดต
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Repair Report')),
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
            ElevatedButton(
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
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
              onPressed: updateRepairReport,
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
