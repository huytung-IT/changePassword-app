import 'package:flutter/material.dart';
import 'change_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChangePassword',
     home: ChangePasswordScreen(),
    );
  }
}
