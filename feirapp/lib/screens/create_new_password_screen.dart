// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool _rememberPassword = false;
  String _password = '';
  String _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Criar Nova Senha',
                    style: TextStyle(
                      color: AppColors.textStyle,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 380,
                height: 270,
                child: Image.asset(
                  'images/forgot_password.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                child: Text(
                  'Crie sua nova senha',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                width: 400,
              ),
              SizedBox(
                height: 16,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: !_passwordVisible,
                      cursorColor: AppColors.textStyle,
                      textAlignVertical: TextAlignVertical.center,
                      obscuringCharacter: '●',
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_rounded,
                          color: AppColors.textStyle,
                        ),
                        labelText: 'Senha',
                        labelStyle: TextStyle(
                          color: AppColors.textStyle,
                          fontSize: 16,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Padding(
                          child: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                              color: AppColors.textStyle,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A senha é obrigatória';
                        } else {
                          _password = value;
                        }
                        return null;
                      },
                      onChanged: (value) => _password = value,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      obscureText: !_confirmPasswordVisible,
                      cursorColor: AppColors.textStyle,
                      obscuringCharacter: '●',
                      style: TextStyle(fontSize: 20),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.lock_rounded,
                          color: AppColors.textStyle,
                        ),
                        labelStyle: TextStyle(
                          color: AppColors.textStyle,
                          fontSize: 16,
                        ),
                        labelText: 'Confirmação da Senha',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Padding(
                          child: IconButton(
                            icon: Icon(
                              _confirmPasswordVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                              color: AppColors.textStyle,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmPasswordVisible =
                                    !_confirmPasswordVisible;
                              });
                            },
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A confirmação da senha é obrigatória';
                        } else {
                          _confirmPassword = value;
                        }
                        return null;
                      },
                      onChanged: (value) => _confirmPassword = value,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _rememberPassword = !_rememberPassword;
                            });
                          },
                          icon: Icon(
                            _rememberPassword
                                ? Icons.check_box_rounded
                                : Icons.check_box_outline_blank_rounded,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Text('Lembrar senha'),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (_password != _confirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.backgroundIconColor,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 70),
                              elevation: 30,
                              content: Text(
                                'As senhas não conferem!',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        } else if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
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
            ],
          ),
        ),
      )),
    );
  }
}
