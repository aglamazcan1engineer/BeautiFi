import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:beautifi/theme/app_theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: Text('Forgot Password Screen'),
      ),
    );
  }
}
