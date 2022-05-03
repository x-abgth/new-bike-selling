import 'package:flutter/material.dart';
import '../screens/notification_screen/NofificationPage.dart';
import '../screens/profile_screen/ProfilePage.dart';
import '../screens/home_screen/HomePage.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 1;
  final List _nextPage = [
    NotificationsPage(),
    HomePage(),
    ProfilePage(),
  ];
  final List _icons = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.notifications, size: 30), label: "Notifications"),
    BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.person, size: 30), label: "Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _nextPage[currentIndex] ?? _nextPage[1],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: _icons,
          selectedItemColor: Theme.of(context).primaryColor,
          selectedLabelStyle: TextStyle(fontSize: 20),
          unselectedLabelStyle: TextStyle(fontSize: 18),
          onTap: (index) {
            setState(() {
              this.currentIndex = index;
            });
          }),
    );
  }
}
