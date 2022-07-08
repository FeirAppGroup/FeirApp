// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordCodeScreen extends StatelessWidget {
  const ForgotPasswordCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _number1;
    String _number2;
    String _number3;
    String _number4;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Get.offNamed(Routes.forgotPasswordScreen);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Esqueceu a senha',
                  style: TextStyle(
                    color: AppColors.textStyle,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                0,
                150,
                0,
                150,
              ),
              child: Center(
                child: SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Codigo enviado para ',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '+55 (35) * ****-3599',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Código inválido';
                                    } else {
                                      _number1 = value;
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => _number1 = value,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: AppColors.backgroundIconColor,
                              ),
                            ),
                            Container(
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Código inválido';
                                    } else {
                                      _number1 = value;
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => _number1 = value,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: AppColors.backgroundIconColor,
                              ),
                            ),
                            Container(
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Código inválido';
                                    } else {
                                      _number1 = value;
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => _number1 = value,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: AppColors.backgroundIconColor,
                              ),
                            ),
                            Container(
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
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Código inválido';
                                    } else {
                                      _number1 = value;
                                    }
                                    return null;
                                  },
                                  onChanged: (value) => _number1 = value,
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: AppColors.backgroundIconColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          'Reenviar código',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: Text(
                'Verificar',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Get.offNamed(Routes.createNewPasswordScreen);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                primary: AppColors.primaryColor,
                fixedSize: Size(
                  380,
                  60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
