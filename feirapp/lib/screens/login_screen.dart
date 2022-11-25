// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/models/dtos/login_dto.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:feirapp/utils/dimensions.dart';
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

  bool isLoading = false;

  Future<void> _login() async {
    setState(() {
      isLoading = true;
    });
    var resp = await Get.find<LoginController>().postAuth(
      LoginDTO(
        login: _email!,
        senha: _password!,
      ),
    );
    setState(() {
      isLoading = false;
    });
    if (resp == 'Login realizado com sucesso.') {
      showModal(context, resp,
          true); //esse bool serve para selecionar a rota e a mensagem do modal
    } else {
      showModal(context, resp, false);
    }
  }

  final _formKey = GlobalKey<FormState>();
  final formValidVN = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Faça login',
        ),
        leading: IconButton(
          onPressed: () {
            Get.toNamed(
              Routes.getTabScreen(),
            );
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Colors.transparent,
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
                        AppConstants.URL_LOGO,
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
                              return 'Este campo é obrigatório';
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
                            fontSize: Dimensions.font16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onTap: () => {
                          Get.offNamed(Routes.forgotPasswordScreen),
                        },
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
                                      //realiza método de login
                                      _login();
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
                      // SizedBox(
                      //   width: double.infinity,
                      //   child: ValueListenableBuilder<bool>(
                      //     valueListenable: formValidVN,
                      //     builder: (context, formValid, child) {
                      //       return ElevatedButton(
                      //         onPressed: () => {},
                      //         style: ElevatedButton.styleFrom(
                      //           shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(40),
                      //           ),
                      //           primary: AppColors.secondaryColor,
                      //           fixedSize: Size(300, 50),
                      //         ),
                      //         child: Text(
                      //           'Sou produtor',
                      //           style: TextStyle(
                      //               fontSize: 17,
                      //               fontWeight: FontWeight.w700,
                      //               color: Colors.white,
                      //               fontFamily: 'Urbanist'),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 30,
                      // )
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

showModal(BuildContext context, String text, bool success) {
  // configura o button
  Widget okButton = TextButton(
    child: Text(
      "OK",
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    onPressed: () {
      Get.toNamed(Routes.getTabScreen());
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
          "Login",
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
