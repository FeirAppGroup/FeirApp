// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/utils/dimensions.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late bool isEmail = true;

  String _email = '';

  var loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Recupere sua senha',
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
                _cardTypeSend(
                  isEmail
                      ? AppColors.primaryColor
                      : AppColors.backgroundIconColor,
                  Icons.email_rounded,
                ),
                space16,
              ],
            ),
          ),
        ),
      ),
      bottomSheet: buttonSendEmail(),
      resizeToAvoidBottomInset: false,
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

  _cardTypeSend(Color colors, IconData icone) => Container(
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
                width: 16,
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
                width: 16,
              ),
              Container(
                width: 250,
                height: Dimensions.height45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    labelText: 'Digite seu e-mail:',
                    labelStyle: TextStyle(
                      fontSize: 16,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                  ),
                  onChanged: (value) {
                    _email = value;
                  },
                ),
              ),
            ],
          ),
        ),
      );

  buttonSendEmail() => SizedBox(
        height: 80,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12, top: 8),
            child: ElevatedButton(
              onPressed: () async {
                bool confirm = false;
                _email == ''
                    ? null
                    : confirm = await loginController.resetPassword(_email);

                if (confirm) {
                  showModal(
                      'Um código foi enviado para o seu email, utilize como senha e depois de logar cadastre uma nova senha!',
                      confirm);
                } else {
                  showModal('Verifique seu email e tente novamente!', confirm);
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                primary: _email == ''
                    ? AppColors.lightColorScheme.primaryContainer
                    : AppColors.primaryColor,
                fixedSize: Size(
                  380,
                  60,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right_alt_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  showModal(String text, bool success) {
    // configura o button
    Widget okButton = TextButton(
      child: Text(
        "Continuar",
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Get.toNamed(Routes.getLoginScreen());
      },
    );

    Widget retryButton = TextButton(
      child: Text(
        "Tentar novamente",
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alerta = AlertDialog(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          40,
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            "Sacola",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      contentPadding: EdgeInsets.all(24),
      actionsPadding: EdgeInsets.only(bottom: 16),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        success ? okButton : retryButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
