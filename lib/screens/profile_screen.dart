import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:beautifi/utils/colors.dart';
import 'package:beautifi/screens/follow_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  // ignore: unused_field
  bool _isLoading = false;

  // Dummy data for followers and following
  final List<String> followers = ['User1', 'User2', 'User3'];
  final List<String> following = ['User4', 'User5', 'User6'];

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() {
    // TODO: Load user data from Firestore
    setState(() {
      _usernameController.text = "User123";
      _bioController.text = "This is a bio";
    });
  }

  void updateProfile() async {
    // ... (keep the existing updateProfile logic)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              _usernameController.text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(_bioController.text),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFollowColumn('Posts', '0'),
                _buildFollowColumn('Followers', followers.length.toString(),
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FollowScreen(title: 'Followers', users: followers),
                    ),
                  );
                }),
                _buildFollowColumn('Following', following.length.toString(),
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FollowScreen(title: 'Following', users: following),
                    ),
                  );
                }),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: updateProfile,
              child: Text('Edit Profile'),
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowColumn(String title, String count, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(count,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(title),
        ],
      ),
    );
  }
}
