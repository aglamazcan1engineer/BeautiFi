import 'package:flutter/material.dart';
import 'package:beautifi/screens/login_screen.dart';
import 'package:beautifi/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeautiFi',
      theme: AppTheme.theme,
      home: const LoginScreen(),
    );
  }
}
