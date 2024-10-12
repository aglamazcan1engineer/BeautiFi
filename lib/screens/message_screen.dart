import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_screen.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Messages',
            style: GoogleFonts.lexendDeca(
              color: Color(0xFF030303),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.add, color: Color(0xFFFF69B4), size: 28),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(child: _buildMessageList()),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(18),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search conversations',
            hintStyle: GoogleFonts.lexendDeca(
              fontSize: 14,
              color: Color(0xFF94A3B8),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.search, size: 16, color: Color(0xFF94A3B8)),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    final List<Map<String, dynamic>> messages = [
      {
        'name': 'Lily',
        'message': 'Skincare Routine',
        'time': '1m ago',
        'isAI': true
      },
      {
        'name': 'Jane Smith',
        'message': 'Let\'s meet up tomorrow!',
        'time': '2h ago',
        'isAI': false
      },
      {
        'name': 'Alex Johnson',
        'message': 'Thanks for the tips!',
        'time': 'Yesterday',
        'isAI': false
      },
      {
        'name': 'Chris Lee',
        'message': 'Got it, thank you!',
        'time': '2 days ago',
        'isAI': false
      },
    ];

    return ListView.separated(
      itemCount: messages.length,
      separatorBuilder: (context, index) => Divider(height: 1),
      itemBuilder: (context, index) {
        final message = messages[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor:
                message['isAI'] as bool ? Colors.teal : Colors.grey,
            child: message['isAI'] as bool
                ? Icon(Icons.auto_awesome, color: Colors.white)
                : Text((message['name'] as String? ?? '')[0],
                    style: GoogleFonts.lexendDeca(color: Colors.white)),
          ),
          title: Text(
            message['name'] as String? ?? '',
            style: GoogleFonts.lexendDeca(
                fontSize: 16,
                color: Color(0xFF030303),
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            message['message'] as String? ?? '',
            style:
                GoogleFonts.lexendDeca(fontSize: 14, color: Color(0xFF727272)),
          ),
          trailing: Text(
            message['time'] as String? ?? '',
            style:
                GoogleFonts.lexendDeca(fontSize: 12, color: Color(0xFF727272)),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  name: message['name'] as String? ?? '',
                  subtitle: message['message'] as String? ?? '',
                ),
              ),
            );
          },
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
          Icon(Icons.edit, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
    );
  }
}
