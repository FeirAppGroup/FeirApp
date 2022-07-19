// ignore_for_file: prefer_const_constructors

import 'package:feirapp/screens/home/home_screen.dart';
import 'package:feirapp/screens/my-cart/my_cart_screen.dart';
import 'package:feirapp/screens/orders/orders_screen.dart';
import 'package:feirapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  //TODO: Adicionar as páginas tabs aqui

  int _selectedIndex = 0;

  List pages = [
    HomeScreen(),
    Container(
      child: Center(
        child: Text("Next page"),
      ),
    ),
    OrdersScreen(),
    MyCartScreen(),
    WelcomeScreen(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green[300],
        unselectedItemColor: Colors.black45,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_book,
            ),
            label: 'history',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: 'orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'me',
          ),
        ],
      ),
    );
  }
}
