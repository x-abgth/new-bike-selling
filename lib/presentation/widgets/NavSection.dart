import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import '../screens/notification_screen/NofificationPage.dart';
import '../screens/profile_screen/ProfilePage.dart';
import '../screens/home_screen/HomePage.dart';

class NavSection extends StatefulWidget {
  @override
  _NavSectionState createState() => _NavSectionState();
}

class _NavSectionState extends State<NavSection> {
  int selectedItem = 1;
  final List _nextPage = [
    NotificationsPage(),
    HomePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _nextPage[selectedItem] == null
          ? _nextPage[1]
          : _nextPage[selectedItem],
      bottomNavigationBar: FFNavigationBar(
          selectedIndex: selectedItem,
          theme: FFNavigationBarTheme(
            barHeight: 60,
            selectedItemIconColor: Theme.of(context).primaryColor,
            selectedItemBorderColor: Theme.of(context).primaryColor,
            barBackgroundColor: Colors.black,
            showSelectedItemShadow: true,
            unselectedItemLabelColor: Colors.grey,
            unselectedItemBackgroundColor: Colors.transparent,
            selectedItemBackgroundColor: Colors.black,
            selectedItemLabelColor: Theme.of(context).primaryColor,
          ),
          items: [
            buildBottomNavigationBarItem(
              context,
              Icons.notifications_none,
              Icons.notifications,
              "Notification",
            ),
            buildBottomNavigationBarItem(
              context,
              Icons.home_outlined,
              Icons.home,
              "Home",
            ),
            buildBottomNavigationBarItem(
              context,
              Icons.person_outline,
              Icons.person,
              "Profile",
            ),
          ],
          onSelectTab: (index) {
            setState(() {
              selectedItem = index;
            });
          }),
    );
  }
}

FFNavigationBarItem buildBottomNavigationBarItem(
  BuildContext context,
  IconData iconData,
  IconData iconData2,
  String label,
) {
  return FFNavigationBarItem(
    animationDuration: Duration(seconds: 10),
    itemWidth: 80,
    iconData: iconData2,
    label: "$label",
  );
}
