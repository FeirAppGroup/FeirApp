// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/widgets/button_primary_widget.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:feirapp/widgets/header_icon_title_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordCodeScreen extends StatefulWidget {
  const ForgotPasswordCodeScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordCodeScreen> createState() =>
      _ForgotPasswordCodeScreenState();
}

class _ForgotPasswordCodeScreenState extends State<ForgotPasswordCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final String _number1 = '';
  final String _number2 = '';
  final String _number3 = '';
  final String _number4 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Esqueceu a senha',
        route: Routes.forgotPasswordScreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _containerValidateCode(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ButtonPrimaryWidget(
                text: 'Verificar',
                route: Routes.createNewPasswordScreen,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final spaceTopHeader = SizedBox(
    height: 60,
  );

  _containerValidateCode() => Padding(
        padding: const EdgeInsets.fromLTRB(
          0,
          150,
          0,
          150,
        ),
        child: Center(
          child: SizedBox(
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _rowLabelSendCode(),
                _formValidateCode(),
                _linkReenviarCode,
              ],
            ),
          ),
        ),
      );

  _formValidateCode() => Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _inputVaidateCode(_number1),
            space,
            _inputVaidateCode(_number2),
            space,
            _inputVaidateCode(_number3),
            space,
            _inputVaidateCode(_number4),
          ],
        ),
      );

  _inputVaidateCode(String _number) => Container(
        width: 60,
        height: 60,
        child: Center(
          child: TextFormField(
            keyboardType: TextInputType.number,
            maxLength: 1,
            maxLines: 1,
            cursorColor: AppColors.textStyle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              counterText: '',
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Código obrigatório';
              } else {
                _number = value;
              }
              return null;
            },
            onChanged: (value) => _number = value,
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
          color: AppColors.backgroundIconColor,
        ),
      );

  final space = Container(width: 16);

  final _linkReenviarCode = GestureDetector(
    child: Text(
      'Reenviar código',
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 16,
      ),
    ),
    onTap: () {},
  );

  _rowLabelSendCode() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _textSize18('Código enviado para '),
          _textSize18('+55 (35) * ****-3599'),
        ],
      );

  _textSize18(String text) => Text(
        text,
        style: TextStyle(
          fontSize: 18,
        ),
      );
}
