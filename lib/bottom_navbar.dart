import 'package:flutter/material.dart';
import 'package:quiz_pertama/count_kite.dart';
import 'package:quiz_pertama/count_triangle.dart';
import 'package:quiz_pertama/profile_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    CountTriangle(),
    CountKite(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz TPM'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Segitiga',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'Layang - layang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        currentIndex: selectedIndex,
      ),
    );
  }
}
