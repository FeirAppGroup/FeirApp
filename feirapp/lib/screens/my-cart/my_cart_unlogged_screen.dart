// ignore_for_file: prefer_const_constructors

import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCartUnloggedScreen extends StatelessWidget {
  const MyCartUnloggedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Minha Sacola'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 200,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              0,
              20,
              0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Sacola Vazia',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Image.asset(
                  'assets/images/cart-empty.png',
                  width: 200,
                  height: 200,
                ),
                Text(
                  'Faça login ou cadastre-se para adicionar itens na sacola!',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      primary: AppColors.primaryColor,
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () => {
                    Get.toNamed(
                      Routes.getLoginScreen(),
                    ),
                  },
                  child: Text(
                    "Fazer Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
