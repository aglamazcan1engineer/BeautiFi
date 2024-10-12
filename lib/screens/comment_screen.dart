import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentScreen extends StatefulWidget {
  final String postId;
  final int commentCount;

  CommentScreen({required this.postId, required this.commentCount});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  List<Map<String, String>> comments = [
    {
      'username': 'Alice Johnson',
      'text':
          'I absolutely love the new skincare routine suggested by BeautiFi!',
      'time': '2 hours ago'
    },
    {
      'username': 'Michael Brown',
      'text': 'The makeup tips are spot on! Thanks BeautiFi!',
      'time': '5 hours ago'
    },
    {
      'username': 'Emma Williams',
      'text': 'Great product recommendations! I found exactly what I needed.',
      'time': '1 day ago'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          _buildCommentInput(),
          Expanded(child: _buildCommentList()),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 60,
      color: Color(0xFF20B2AA),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.auto_fix_high, color: Colors.white, size: 16),
          SizedBox(width: 8),
          Text(
            'BeautiFi',
            style: GoogleFonts.lexendDeca(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 58,
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      hintStyle: GoogleFonts.lexendDeca(
                          fontSize: 14, color: Color(0xFF94A3B8)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(29)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              child: Text(
                'Post Comment',
                style:
                    GoogleFonts.lexendDeca(fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEC4899),
                minimumSize: Size(147, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: _addComment,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentList() {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 20),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        comment['username']!,
                        style: GoogleFonts.lexendDeca(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF030303)),
                      ),
                      Text(
                        comment['time']!,
                        style: GoogleFonts.lexendDeca(
                            fontSize: 10, color: Color(0xFF727272)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                comment['text']!,
                style: GoogleFonts.lexendDeca(
                    fontSize: 14, color: Color(0xFF030303)),
              ),
              SizedBox(height: 8),
              Text(
                'Reply',
                style: GoogleFonts.lexendDeca(
                    fontSize: 14, color: Color(0xFFEC4899)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 50,
      color: Color(0xFF008080),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.search, color: Colors.white),
          Icon(Icons.edit, color: Colors.white, size: 30),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
    );
  }

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        comments.insert(0, {
          'username': 'CurrentUser',
          'text': _commentController.text,
          'time': 'Just now',
        });
        _commentController.clear();
      });
    }
  }
}
