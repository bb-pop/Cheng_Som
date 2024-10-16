import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Role App',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: LoginScreen(),
      routes: {
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}