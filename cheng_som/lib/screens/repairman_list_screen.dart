import 'package:flutter/material.dart';
import 'add_repairman_screen.dart';
import 'edit_repairman_screen.dart'; // นำเข้าไฟล์สำหรับแก้ไขช่างซ่อม
import '../service/repairman_service.dart';
import '../models/repairman.dart';

class RepairmanListScreen extends StatefulWidget {
  @override
  _RepairmanListScreenState createState() => _RepairmanListScreenState();
}

class _RepairmanListScreenState extends State<RepairmanListScreen> {
  List<Repairman> repairmen = [];

  @override
  void initState() {
    super.initState();
    fetchRepairmen();
  }

  Future<void> fetchRepairmen() async {
    repairmen = await RepairmanService().getAllRepairmen();
    setState(() {});
  }

  Future<void> deleteRepairman(String id) async {
    await RepairmanService().deleteRepairman(id);
    fetchRepairmen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repairman List'),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddRepairmanScreen()),
            ).then((_) {
              fetchRepairmen();
            });
          },
        ),
      ),
      body: repairmen.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: repairmen.length,
              itemBuilder: (context, index) {
                final repairman = repairmen[index];
                return ListTile(
                  title: Text('${repairman.firstName} ${repairman.lastName}'),
                  subtitle: Text(repairman.phoneNumber),
                  leading: Icon(Icons.person),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditRepairmanScreen(repairman: repairman),
                            ),
                          ).then((_) {
                            fetchRepairmen(); // อัปเดตรายการหลังจากแก้ไข
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Confirm Deletion'),
                                content: Text('Are you sure you want to delete this repairman?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      deleteRepairman(repairman.id);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Delete'),
                                  ),
                                ],
                              );
                            },
                          );
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
