import 'package:flutter/material.dart';
import 'sebha_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // Default to Sebha Screen

  final List<Widget> _screens = [
    const Center(child: Text('Quran', style: TextStyle(color: Colors.white, fontSize: 30))),
    const Center(child: Text('Hadith', style: TextStyle(color: Colors.amber, fontSize: 30))),
    const SebhaScreen(),
    const Center(child: Text('Radio', style: TextStyle(color: Colors.amber, fontSize: 30))),
    const Center(child: Text('Dates', style: TextStyle(color: Colors.white, fontSize: 30))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: const Color(0xFFE2BE7F)),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFF1C1C1C),
          items: [
            const BottomNavigationBarItem(
              backgroundColor: Colors.amber,
              icon: Icon(Icons.menu_book),
              label: 'Quran',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Hadith',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: _selectedIndex == 2 ? const Color(0xFF1C1C1C).withOpacity(0.5) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const ImageIcon(AssetImage('assets/images/logo_sebha.png')),
              ),
              label: 'Sebha',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.radio),
              label: 'Radio',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.access_time),
              label: 'Dates',
            ),
          ],
        ),
      ),
    );
  }
}
