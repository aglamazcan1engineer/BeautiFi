import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(),
          _buildTabBar(),
          Expanded(
            child: _buildNotificationList(),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE5E7EB),
            width: 1,
          ),
        ),
      ),
      child: Center(
        child: Text(
          'Notification',
          style: GoogleFonts.lexendDeca(
            fontSize: 24,
            color: Color(0xFF030303),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'All',
            style: GoogleFonts.lexendDeca(
              fontSize: 16,
              color: Color(0xFFFF69B4),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 132),
          Text(
            'BeautiFi',
            style: GoogleFonts.lexendDeca(
              fontSize: 16,
              color: Color(0xFF727272),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildDateHeader('Today'),
        _buildNotificationItem('Sarah liked your post', '2h ago',
            Icons.favorite, Color(0xFF030303)),
        _buildNotificationItem('John commented on your photo', '3h ago',
            Icons.comment, Color(0xFF030303)),
        _buildDateHeader('Yesterday'),
        _buildNotificationItem('New AI beauty tip available', '1d ago',
            Icons.lightbulb, Color(0xFF20B2AA),
            isAI: true),
        _buildNotificationItem('Product recommendation based on AI analysis',
            '1d ago', Icons.shopping_bag, Color(0xFF20B2AA),
            isAI: true),
      ],
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        date,
        style: GoogleFonts.lexendDeca(
          fontSize: 14,
          color: Color(0xFF727272),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
      String text, String time, IconData icon, Color textColor,
      {bool isAI = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor:
                isAI ? Color(0xFF20B2AA).withOpacity(0.2) : Colors.grey[300],
            child: Icon(icon,
                color: isAI ? Color(0xFF20B2AA) : Colors.white, size: 20),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: GoogleFonts.lexendDeca(
                    fontSize: 14,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: GoogleFonts.lexendDeca(
                    fontSize: 12,
                    color: Color(0xFF4F4F4F),
                  ),
                ),
              ],
            ),
          ),
          if (isAI) Icon(Icons.star, color: Color(0xFF20B2AA), size: 16),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 40,
      color: Color(0xFF008080),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.white, size: 28),
          Icon(Icons.search, color: Colors.white, size: 28),
          Icon(Icons.edit, color: Colors.white, size: 30),
          Icon(Icons.person_outline, color: Colors.white, size: 28),
        ],
      ),
    );
  }
}
