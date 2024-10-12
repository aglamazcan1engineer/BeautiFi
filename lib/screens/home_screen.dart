import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:beautifi/screens/notification_screen.dart';
import 'package:beautifi/screens/message_screen.dart';
import 'package:beautifi/screens/comment_screen.dart';
import 'package:beautifi/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.auto_fix_high, color: Color(0xFFEC4899), size: 28),
            SizedBox(width: 6),
            Text(
              'BeautiFi',
              style: GoogleFonts.lexendDeca(
                color: Color(0xFFEC4899),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:
                Icon(Icons.favorite_border, color: Color(0xFF20B2AA), size: 26),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline,
                color: Color(0xFF20B2AA), size: 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessageScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildStoryBar(),
          Expanded(
            child: ListView(
              children: [
                _buildPost(
                    context, 'party_arty_dk', 'Expressing gratitude', 20, 300),
                _buildTextPost(
                    context, 'daily_quotes333', 'Making lemon cake', 1, 12),
                _buildPost(
                    context, 'party_arty_dk', 'Expressing gratitude', 20, 300),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildStoryBar() {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildStoryItem('You', isYou: true),
          _buildStoryItem('mariio5'),
          _buildStoryItem('lea_98'),
          _buildStoryItem('loco_cafe'),
          _buildStoryItem('gabriel_g'),
        ],
      ),
    );
  }

  Widget _buildStoryItem(String name, {bool isYou = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isYou
                  ? null
                  : LinearGradient(
                      colors: [Color(0xFFEC4899), Color(0xFF20B2AA)],
                    ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: isYou ? Icon(Icons.add, color: Colors.white) : null,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(name, style: GoogleFonts.lexendDeca(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPost(BuildContext context, String username, String caption,
      int comments, int likes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey[300]),
          title: Text(username, style: GoogleFonts.lexendDeca()),
          trailing: Icon(Icons.more_horiz),
        ),
        Image.network(
          'https://picsum.photos/400/400',
          fit: BoxFit.cover,
          height: 300,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.chat_bubble_outline,
                    color: Color(0xFF030303), size: 16),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentScreen(
                          postId: username, commentCount: comments),
                    ),
                  );
                },
              ),
              Text(
                '$comments',
                style: GoogleFonts.lexendDeca(
                    fontSize: 12, color: Color(0xFF4F4F4F)),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.favorite, color: Color(0xFFEC4899), size: 26),
                onPressed: () {
                  // TODO: Implement like functionality
                },
              ),
              Text(
                '$likes',
                style: GoogleFonts.lexendDeca(
                    fontSize: 12, color: Color(0xFF4F4F4F)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(caption, style: GoogleFonts.lexendDeca()),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTextPost(BuildContext context, String username, String text,
      int comments, int likes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey[300]),
          title: Text(username, style: GoogleFonts.lexendDeca()),
          trailing: Icon(Icons.more_horiz),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text, style: GoogleFonts.lexendDeca(fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.chat_bubble_outline,
                    color: Color(0xFF030303), size: 16),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentScreen(
                          postId: username, commentCount: comments),
                    ),
                  );
                },
              ),
              Text(
                '$comments',
                style: GoogleFonts.lexendDeca(
                    fontSize: 12, color: Color(0xFF4F4F4F)),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.favorite, color: Color(0xFFEC4899), size: 26),
                onPressed: () {
                  // TODO: Implement like functionality
                },
              ),
              Text(
                '$likes',
                style: GoogleFonts.lexendDeca(
                    fontSize: 12, color: Color(0xFF4F4F4F)),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 50,
      color: Color(0xFF008080),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {
              // Already on home screen, no action needed
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add_box_outlined, color: Colors.white),
            onPressed: () {
              // TODO: Implement post creation functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.white),
            onPressed: () {
              // TODO: Implement profile page navigation
            },
          ),
        ],
      ),
    );
  }
}
