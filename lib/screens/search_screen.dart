import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> searchHistory = [
    {'name': 'Sylvia', 'image': 'assets/sylvia.jpg'},
    {'name': 'Clara', 'image': 'assets/clara.jpg'},
    {'name': 'Jasmine', 'image': 'assets/jasmine.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(child: _buildSearchHistory()),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for beauty products',
                hintStyle: GoogleFonts.lexendDeca(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          SizedBox(width: 8),
          TextButton(
            onPressed: () {
              _searchController.clear();
            },
            child: Text('Clear',
                style: GoogleFonts.lexendDeca(color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchHistory() {
    return ListView.separated(
      itemCount: searchHistory.length,
      separatorBuilder: (context, index) => Divider(height: 1),
      itemBuilder: (context, index) {
        final item = searchHistory[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(item['image']!),
          ),
          title: Text(item['name']!, style: GoogleFonts.lexendDeca()),
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
          Icon(Icons.add_box_outlined, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
    );
  }
}
