// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/controllers/profile_user_controller.dart';
import 'package:feirapp/models/profile_user_model.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ProfileUserScreen extends StatefulWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  State<ProfileUserScreen> createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  ProfileUserModel? profile;
  var loginController = Get.find<LoginController>();
  var profileController = Get.find<ProfileUserController>();

  Future<void> carregaInfoProfile() async {
    if (loginController.user != null) {
      profile = await profileController.getInfoProfile(
        loginController.user!.id,
        loginController.user!.token,
      );
    } else {
      loginController.logout();
      Get.back();
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _updateUser() async {
    setState(() {
      isLoading = true;
    });

    var resp = await profileController.updateProfile(
        profile!, loginController.user!.token);

    setState(() {
      isLoading = false;
    });
    showModal(context, resp);
  }

  @override
  initState() {
    carregaInfoProfile();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final formValidVN = ValueNotifier<bool>(false);

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Sair',
            onPressed: () {
              loginController.logout();
              Get.toNamed(
                Routes.getLoginScreen(),
              ); //Itredirect  after 3 second
            },
          ),
        ],
        title: const Text('Perfil'),
        backgroundColor: Colors.transparent,
      ),
      body: isLoading
          ? Center(
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
            )
          : Container(
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
                              profile!.nome = value;
                            }
                            return null;
                          },
                          onSaved: (value) => profile!.nome = value!,
                          initialValue: profile!.nome,
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
                          onSaved: (value) => profile!.email = value!,
                          initialValue: profile!.email,
                          readOnly: true,
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
                              profile!.cpf = value;
                            }
                            return null;
                          },
                          onSaved: (value) => profile!.cpf = value!,
                          initialValue: profile!.cpf,
                          readOnly: true,
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
                              profile!.telefone = value;
                            }
                            return null;
                          },
                          onSaved: (value) => profile!.telefone = value!,
                          initialValue: profile!.telefone,
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
                              profile!.cep = value;
                            }
                            return null;
                          },
                          onSaved: (value) => profile!.cep = value!,
                          initialValue: profile!.cep,
                        ),
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
                                      _updateUser();
                                    },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                primary: AppColors.primaryColor,
                                fixedSize: Size(300, 50),
                              ),
                              child: Text(
                                'Atualizar',
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
                      dividerLine,
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(
                              Routes.getCreateNewPasswordScreen(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            primary: AppColors.primaryColor,
                            fixedSize: Size(300, 50),
                          ),
                          child: Text(
                            'Alterar senha',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        ),
                      ),
                      //TODO: Colocar opção para mudar o tema
                    ],
                  ),
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

showModal(BuildContext context, String text) {
  bool success = text == 'Informações atualizadas com sucesso!';

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
      Navigator.pop(context);
    },
  );
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
            success
                ? 'assets/images/congratulations.png'
                : 'assets/images/error.png',
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

var dividerLine = Container(
  margin: EdgeInsets.only(top: Dimensions.height10),
  child: Divider(
    color: AppColors.greyColor,
    thickness: 2,
    indent: Dimensions.width20,
    endIndent: Dimensions.width20,
  ),
);
