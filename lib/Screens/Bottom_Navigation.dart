import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled12/Screens/Cart.dart';
import 'package:untitled12/Screens/Whishlist.dart';
import 'package:untitled12/main.dart';

import 'Home_Screen.dart';
import 'Search.dart';
import 'Settings.dart';
import 'Cart.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final screens = [
    HomeScreen(),
    Whishlist(),
    Cart(),
    Search(),
    Settings(),

  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(color: Colors.red),
        unselectedLabelStyle: TextStyle(color: Colors.yellowAccent),
        selectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BootstrapIcons.heart,
            ),
            label: 'Whishlist',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(backgroundColor: Colors.pinkAccent,
              radius: 20.r,
              child: Icon(
                BootstrapIcons.cart,

              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
             
            ),
            label: 'Settings',
          ),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}
