import 'package:beezap_locate/ui/history.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';



class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const HistoryScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.dashboard),
                label: "Home", backgroundColor: Color(0xFF32BCBC)),
            BottomNavigationBarItem(icon: Icon(Icons.history ),label: "History",
                backgroundColor: Color(0xFF32BCBC)),

          ],

          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,

          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
