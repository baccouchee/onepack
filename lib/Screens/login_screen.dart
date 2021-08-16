import 'package:flutter/material.dart';
import 'package:onepack/Components/login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Login(
          backgroundColor1: Color(0xFFCACACA),
          backgroundColor2: Color(0xFFE2E2E2),
          highlightColor: Color(0xFF1F1F57),
          foregroundColor: Color(0xFF1F1F57),
          logo: AssetImage("assets/images/logo.png"),
        ),
      ),
    );
  }
}
