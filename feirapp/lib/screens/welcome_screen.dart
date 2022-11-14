// ignore_for_file: prefer_const_constructors

import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Bem vindo',
                        style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textStyle),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'ao',
                          style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textStyle),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'FeirApp',
                          style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 55,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          primary: AppColors.primaryColor,
                          minimumSize: const Size.fromHeight(50)),
                      onPressed: () =>
                          {Get.toNamed(Routes.getRegisterScreen())},
                      child: Text(
                        "Cadastre-se",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Já possui cadastro? ",
                          style: TextStyle(
                              color: AppColors.textStyle,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w700,
                              fontSize: 17),
                        ),
                        InkWell(
                          child: Text(
                            "Faça login",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () => {Get.toNamed(Routes.getLoginScreen())},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
