import 'package:flutter/material.dart';
import 'package:lobi_poliwangi_mobile/Beranda/tampilanBeranda.dart';
import 'package:lobi_poliwangi_mobile/profil/profile_guest.dart';
import 'package:lobi_poliwangi_mobile/profil/profile_login.dart';
import 'Beasiswa/tampilanBeasiswa.dart';
import 'Lomba/TampilanLomba.dart';
import 'Preestasi/tampilanPrestasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationDemo(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 7, 40, 88),
      ),
    );
  }
}

class BottomNavigationDemo extends StatefulWidget {
  @override
  _BottomNavigationDemoState createState() => _BottomNavigationDemoState();
}

class _BottomNavigationDemoState extends State<BottomNavigationDemo> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    tampilanBeranda(),
    tampilanBeasiswa(),
    tampilanLomba(),
    tampilanPrestasi(),
    ProfileGuest(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          color: Colors.black,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.black,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/topi.png', width: 30, height: 30),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/topi.png', width: 30, height: 30),
            label: 'Beasiswa',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon lomba.png', width: 30, height: 30),
            label: 'Lomba',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/prestasi.png', width: 30, height: 30),
            label: 'Prestasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}



