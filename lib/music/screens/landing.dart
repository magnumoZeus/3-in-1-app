import 'package:amaan/music/screens/home_screen.dart';
import 'package:amaan/music/screens/local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    LocalScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Show the selected screen
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.music_house,
              //color: Colors.green,
              size: 30.0,
            ),
            label: 'Online',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined),
            label: 'Local',
          ),
        ],
      ),
    );
  }
}
