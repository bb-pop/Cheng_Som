import 'package:flutter/material.dart';
import '../service/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController roomNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: firstNameController, decoration: InputDecoration(labelText: 'First Name')),
            TextField(controller: lastNameController, decoration: InputDecoration(labelText: 'Last Name')),
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: phoneNumberController, decoration: InputDecoration(labelText: 'Phone Number')),
            TextField(controller: roomNumberController, decoration: InputDecoration(labelText: 'Room Number')),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthService().registerUser(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  phoneNumber: phoneNumberController.text,
                  roomNumber: roomNumberController.text,
                  password: passwordController.text,
                );
                Navigator.pop(context); // กลับไปยังหน้าจอเข้าสู่ระบบ
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
