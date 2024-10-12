import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:beautifi/screens/home_screen.dart';
import 'package:beautifi/screens/signup_screen.dart';
import 'package:beautifi/screens/forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 65),
                Text(
                  'BeautiFi',
                  style: GoogleFonts.lexendDeca(
                    fontSize: 36,
                    color: Color(0xFFFF69B4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 32),
                _buildTextField('Username or Email'),
                SizedBox(height: 16),
                _buildTextField('Password', isPassword: true),
                SizedBox(height: 26),
                _buildButton('Log In', Color(0xFFFF69B4), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }),
                SizedBox(height: 20),
                _buildButton('Sign Up', Color(0xFF20B2AA), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                }),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.lexendDeca(
                      fontSize: 14,
                      color: Color(0xFF030303),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialButton(Icons.facebook, Color(0xFF3B5998)),
                    SizedBox(width: 16),
                    _buildSocialButton(Icons.g_mobiledata, Color(0xFFDB4437)),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    'AI-powered beauty advice, social sharing, and shopping',
                    style: GoogleFonts.lexendDeca(
                      fontSize: 12,
                      color: Color(0xFF4F4F4F),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return Container(
      height: 54,
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.lexendDeca(
            fontSize: 14,
            color: Color(0xFF94A3B8),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 343,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.lexendDeca(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
