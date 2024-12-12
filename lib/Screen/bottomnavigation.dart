import 'package:cloud_kitchen/Screen/cartscreen.dart';
import 'package:cloud_kitchen/Screen/menuscreen.dart';
import 'package:cloud_kitchen/Screen/orderscreen.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    MenuScreen(),
    CartScreen(),
    OrderScreen (confirmedOrders: [],),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Orders',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorClass.amberlight,
        onTap: _onItemTapped,
      ),
    );
  }
}