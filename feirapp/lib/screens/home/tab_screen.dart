// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/controllers/profile_user_controller.dart';
import 'package:feirapp/models/dtos/user_login_dto.dart';
import 'package:feirapp/screens/home/showcase_screen.dart';
import 'package:feirapp/screens/my-cart/my_cart_unlogged_screen.dart';
import 'package:feirapp/screens/orders/orders_unlogged_screen.dart';
import 'package:feirapp/screens/profile/profile_user_screen.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:feirapp/screens/home/home_screen.dart';
import 'package:feirapp/screens/my-cart/my_cart_screen.dart';
import 'package:feirapp/screens/orders/orders_screen.dart';
import 'package:feirapp/screens/welcome_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var loginController = Get.find<LoginController>();
  var profileController = Get.find<ProfileUserController>();

  String? token;
  int _selectedIndex = 0;

  bool isLoading = true;

  List<Widget> pages = [
    HomeScreen(),
    ShowcaseScreen(),
    OrdersUnloggedScreen(),
    MyCartUnloggedScreen(),
    WelcomeScreen(),
  ];

  List<Widget> pagesLogin = [
    HomeScreen(),
    ShowcaseScreen(),
    OrdersScreen(),
    MyCartScreen(),
    ProfileUserScreen(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _getToken() async {
    setState(() {
      isLoading = true;
    });
    token = await loginController.getToken();
    if (token != null) {
      //valido se o token ainda é válido para a api
      var userId = await loginController
          .getIdUser(); //esta função pegar o id do usuário guardado no storage do mobile
      try {
        var user =
            await profileController.getInfoProfile(int.parse(userId!), token!);
        if (user != null) {
          await loginController.updateInfoUser(
            UserLoginDto(
              id: user.id!,
              email: user.email,
              nome: user.nome,
              token: token!,
            ),
          );
        }
      } catch (ex) {
        token = null;
        loginController.logout();
        setState(() {
          isLoading = false;
        });
      }
    } else {
      loginController.logout();
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: SpinKitCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                      ),
                    );
                  },
                ),
              ),
            )
          : IndexedStack(
              children: token == null ? pages : pagesLogin,
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
