// ignore_for_file: prefer_const_constructors

import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:feirapp/screens/home/home_screen.dart';
import 'package:feirapp/screens/my-cart/my_cart_screen.dart';
import 'package:feirapp/screens/orders/orders_screen.dart';
import 'package:feirapp/screens/welcome_screen.dart';

import '../../utils/dimensions.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  //TODO: Adicionar as páginas tabs aqui

  int _selectedIndex = 0;

  List<Widget> pages = [
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
      body: IndexedStack(
        children: pages,
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColorLight,
        unselectedItemColor: AppColors.greyColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: Dimensions.font10,
        unselectedFontSize: Dimensions.font10,
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
            label: 'vitrine',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: 'pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'perfil',
          ),
        ],
      ),
    );
  }
}
