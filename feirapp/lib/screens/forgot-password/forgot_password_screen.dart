// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/widgets/button_primary_widget.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late bool isEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Esqueceu a senha',
        route: Routes.tabScreen,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _imageHero('assets/images/forgot-password.png'),
                textHero,
                space16,
                GestureDetector(
                  onTap: () {},
                  child: _cardTypeSend(
                    'via Email:',
                    'luc******uuz@live.com',
                    isEmail
                        ? AppColors.primaryColor
                        : AppColors.backgroundIconColor,
                    Icons.email_rounded,
                  ),
                ),
                space16,
              ],
            ),
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: 75,
        child: Center(
          child: ButtonPrimaryWidget(
              text: 'Continue', route: Routes.forgotPasswordCodeScreen),
        ),
      ),
    );
  }

  final spaceTopHeader = SizedBox(
    height: 60,
  );

  _imageHero(String urlImage) => Container(
        width: 380,
        height: 270,
        child: Image.asset(
          urlImage,
          fit: BoxFit.contain,
        ),
      );

  final textHero = Container(
    child: Center(
      child: Text(
        'Selecione o email de contato que devemos usar para redefinir sua senha',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w100,
        ),
      ),
    ),
    width: 400,
    height: 70,
  );

  final space16 = SizedBox(
    height: 16,
  );

  _cardTypeSend(String type, String destiny, Color colors, IconData icone) =>
      Container(
        width: 380,
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(
            color: colors,
            width: 1.8,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: AppColors.backgroundIconColor,
                ),
                child: Icon(
                  icone,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    destiny,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
