import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:news_app/screens/home_page.dart';
import 'package:news_app/screens/profile_page.dart';
import 'package:news_app/screens/saved_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  late final List<Widget> _pages = [HomePage(), SavedPage(), ProfilePage()];
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111A22),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFF111A22),
        backgroundColor: Color(0xFF111A22),
        buttonBackgroundColor: Color(0xFF1F2A36),
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),

          Icon(Icons.bookmark, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],

        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pages[_page],
    );
  }
}
