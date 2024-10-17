import 'package:cheng_som/screens/hello_admin_screen.dart';
import 'package:cheng_som/screens/hello_member_screen.dart';
import 'package:cheng_som/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import '../models/user.dart';

class AuthService {
  final PocketBase pb = PocketBase('http://127.0.0.1:8090');

  bool isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String roomNumber,
    required String password,
  }) async {
    if (!isValidEmail(email)) {
      throw Exception('Invalid email format');
    }

    try {
      final newUser = await pb.collection('users').create(body: {
        'email': email,
        'password': password,
        'passwordConfirm': password,
        'is_admin': false,
      });

      await pb.collection('members').create(body: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone_number': phoneNumber,
        'room_number': roomNumber,
        'users': newUser.id,
      });
    } catch (error) {
      throw Exception('Registration failed: $error');
    }
  }

  Future<void> loginUser(String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and Password cannot be empty.');
    }

    try {
      final userData = await pb.collection('users').authWithPassword(email, password);

      print('User Data: ${userData.toJson()}'); // แสดงข้อมูลผู้ใช้ใน console

      User user = User.fromJson(userData.toJson());

      print('User: ${user.email}, Is Admin: ${user.isAdmin}'); // แสดงค่าที่ได้รับ

      if (user.isAdmin) {
        // นำไปยังหน้า HelloAdminScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HelloAdminScreen()),
        );
      } else {
        // นำไปยังหน้าสำหรับผู้ใช้ทั่วไป
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HelloMemberScreen()),
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Login error: $error'),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK')),
          ],
        ),
      );
    }
  }

  Future<void> logoutUser(BuildContext context) async {
    try {
      // Clear the authStore
      pb.authStore.clear();

      // Navigate back to the login screen
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false, // Remove all previous routes
      );
    } catch (error) {
      // Show an error dialog if logout fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Logout error: $error'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
