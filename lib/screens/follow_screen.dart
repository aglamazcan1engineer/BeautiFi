import 'package:flutter/material.dart';
import 'package:beautifi/utils/colors.dart';

class FollowScreen extends StatelessWidget {
  final String title;
  final List<String> users;

  const FollowScreen({Key? key, required this.title, required this.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(users[index]),
            trailing: TextButton(
              onPressed: () {
                // TODO: Implement follow/unfollow functionality
                print('Follow/Unfollow ${users[index]}');
              },
              child: Text(title == 'Followers' ? 'Follow' : 'Unfollow'),
            ),
          );
        },
      ),
    );
  }
}
