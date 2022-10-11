// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/profile_user_controller.dart';
import 'package:feirapp/models/enum/tipo_usuario_enum.dart';
import 'package:feirapp/models/profile_user_model.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _fullName;
  String? _email;
  String? _cep;
  String? _password;
  String? _phoneNumber;
  String? _cpf;
  bool agree = false;
  bool _passwordVisible = false;
  bool isLoading = false;

  Future<void> _registerUser() async {
    setState(() {
      isLoading = true;
    });
    var resp = await profileController.registerNewUser(
      ProfileUserModel(
        id: 0,
        nome: _fullName!,
        telefone: _phoneNumber!,
        email: _email!,
        cep: _cep!,
        senha: _password!,
        cpf: _cpf!,
        cnpj: "",
        dap: "",
        tipoUsuario: TipoUsuarioEnum.cliente,
      ),
    );
    setState(() {
      isLoading = false;
    });
    showModal(context, resp);
  }

  final _formKey = GlobalKey<FormState>();
  final formValidVN = ValueNotifier<bool>(false);

  var profileController = Get.find<ProfileUserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criar uma conta',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: !isLoading
          ? Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  onChanged: () {
                    formValidVN.value =
                        _formKey.currentState?.validate() ?? false;
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Center(
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/avatar.png'))),
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.primaryColor,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () => {
                                    //TODO: ainda não vamos adicionar fotos do usuário, colocar foto padrão de sombra
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ThemeData().colorScheme.copyWith(
                                primary: AppColors.primaryColor,
                              ),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textStyle,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400),
                          cursorColor: AppColors.textStyle,
                          decoration: InputDecoration(
                            labelText: 'Nome completo',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.formGrey,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400),
                            filled: true,
                            fillColor: AppColors.fieldBackground,
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
                              return 'Campo obrigatório';
                            } else {
                              _fullName = value;
                            }
                            return null;
                          },
                          onSaved: (value) => _fullName = value,
                        ),
                      ),
                      SizedBox(
                        height: 15,
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
                            suffixIcon: Icon(Icons.email),
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
                        height: 15,
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
                          validator: _validatePassword,
                          onChanged: (value) => _password = value,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 6),
                        child: Text(
                          'Mínimo de 8 caracteres, 1 letra maiúscula, 1 letra minúscula, 1 número',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 9,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ThemeData().colorScheme.copyWith(
                                primary: AppColors.primaryColor,
                              ),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textStyle,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400),
                          cursorColor: AppColors.textStyle,
                          decoration: InputDecoration(
                            labelText: 'CPF',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.formGrey,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400),
                            filled: true,
                            fillColor: AppColors.fieldBackground,
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
                              return 'Campo obrigatório';
                            } else {
                              _cpf = value;
                            }
                            return null;
                          },
                          onSaved: (value) => _cpf = value,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ThemeData().colorScheme.copyWith(
                                primary: AppColors.primaryColor,
                              ),
                        ), //TODO: adicionar mascara para o telefone cep e cpf
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textStyle,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400),
                          cursorColor: AppColors.textStyle,
                          decoration: InputDecoration(
                            labelText: 'Telefone',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.formGrey,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400),
                            filled: true,
                            fillColor: AppColors.fieldBackground,
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
                              return 'Campo obrigatório';
                            } else {
                              _phoneNumber = value;
                            }
                            return null;
                          },
                          onSaved: (value) => _phoneNumber = value,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ThemeData().colorScheme.copyWith(
                                primary: AppColors.primaryColor,
                              ),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textStyle,
                              fontFamily: 'Urbanist',
                              fontWeight: FontWeight.w400),
                          cursorColor: AppColors.textStyle,
                          decoration: InputDecoration(
                            labelText: 'CEP',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                color: AppColors.formGrey,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w400),
                            filled: true,
                            fillColor: AppColors.fieldBackground,
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
                              return 'Campo obrigatório';
                            } else {
                              _cep = value;
                            }
                            return null;
                          },
                          onSaved: (value) => _cep = value,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            side: BorderSide(color: AppColors.fieldBackground),
                            activeColor: AppColors.primaryColor,
                            splashRadius: 4,
                            onChanged: (_) {
                              setState(() {
                                agree = !agree;
                              });
                            },
                            value: agree,
                          ),
                          Flexible(
                            child: Text(
                              'Ao criar uma conta, concordo com os Termos e Condições e a Política de Privacidade.',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                                      _registerUser();
                                    },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                primary: AppColors.primaryColor,
                                fixedSize: Size(300, 50),
                              ),
                              child: Text(
                                'Cadastrar',
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
                        height: 40,
                      )
                    ],
                  ),
                ),
              ),
            )
          : Center(
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
            ),
    );
  }
}

String? _validarEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return "Campo obrigatório";
  } else if (!regExp.hasMatch(value)) {
    return "E-mail inválido";
  } else {
    return null;
  }
}

String? _validatePassword(String? value) {
  RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
  if (value!.isEmpty) {
    return 'Campo obrigatório';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Digite uma senha válida';
    } else {
      return null;
    }
  }
}

showModal(BuildContext context, String text) {
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
      Get.offNamed(Routes.getTabScreen());
    },
  );
  //TODO:: Fazer lógica para quando retornar erro trocar a cor do button e o title
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    elevation: 20,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        40,
      ),
    ),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 190,
          height: 250,
          child: Image.asset(
            'assets/images/congratulations.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          "Cadastro",
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
      okButton,
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
