import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';
import '../utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;

  String? _email;
  String? _password;

  final _formKey = GlobalKey<FormState>();
  final formValidVN = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Faça login',
          style: TextStyle(
            fontFamily: 'Urbanist',
            color: AppColors.textStyle,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        leading: BackButton(color: AppColors.textStyle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Form(
                key: _formKey,
                onChanged: () {
                  formValidVN.value =
                      _formKey.currentState?.validate() ?? false;
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ThemeData().colorScheme.copyWith(
                                primary: AppColors.primaryColor,
                              ),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textStyle,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400),
                          cursorColor: AppColors.textStyle,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.formGrey,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400),
                            filled: true,
                            fillColor: AppColors.fieldBackground,
                            prefixIcon: Icon(Icons.email),
                            contentPadding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20, top: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: _validarEmail,
                          onSaved: (value) => _email = value,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ThemeData().colorScheme.copyWith(
                                primary: AppColors.primaryColor,
                              ),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: !_passwordVisible,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textStyle,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400),
                          cursorColor: AppColors.textStyle,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.formGrey,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400),
                            filled: true,
                            fillColor: AppColors.fieldBackground,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20, top: 20),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required field';
                            } else {
                              _password = value;
                            }
                            return null;
                          },
                          onChanged: (value) => _password = value,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        child: Text(
                          'Esqueci minha senha',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        onTap: () => {},
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ValueListenableBuilder<bool>(
                          valueListenable: formValidVN,
                          builder: (context, formValid, child) {
                            return ElevatedButton(
                              onPressed: !formValid
                                  ? null
                                  : () {
                                      _formKey.currentState!.validate();
                                      _formKey.currentState!.save();
                                    },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                primary: AppColors.primaryColor,
                                fixedSize: Size(300, 50),
                              ),
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontFamily: 'Urbanist'),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Ainda não é membro? ",
                            style: TextStyle(
                                color: AppColors.textStyle,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          InkWell(
                            child: Text(
                              "Cadastre-se",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () =>
                                {Get.toNamed(Routes.getRegisterScreen())},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ValueListenableBuilder<bool>(
                          valueListenable: formValidVN,
                          builder: (context, formValid, child) {
                            return ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                primary: AppColors.secondaryColor,
                                fixedSize: Size(300, 50),
                              ),
                              child: Text(
                                'Sou produtor',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontFamily: 'Urbanist'),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ))),
      ),
    );
  }
}

String? _validarEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return "Required field";
  } else if (!regExp.hasMatch(value)) {
    return "Invalid e-mail";
  } else {
    return null;
  }
}
