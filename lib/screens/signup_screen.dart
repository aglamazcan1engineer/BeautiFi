import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:beautifi/theme/app_theme.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Text('Sign Up Screen'),
      ),
    );
  }
}
