// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/controllers/profile_user_controller.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  String _password = '';
  String _confirmPassword = '';

  var profileController = Get.find<ProfileUserController>();
  var userController = Get.find<LoginController>();

  Future<String> _alterarSenha() async {
    var resp = await profileController.alterarSenha(
      userController.user!.id,
      _password,
      userController.user!.token,
    );

    return resp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Alterar Senha',
        route: Routes.profileUserScreen,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageHero('assets/images/forgot-password-sucess.png'),
              space16,
              _textHero('Criar sua nova senha'),
              space16,
              _buildFormNewPassword(),
            ],
          ),
        ),
      )),
    );
  }

  _buildFormNewPassword() => Form(
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
                  fontSize: 16,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
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
            space16,
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
                  fontSize: 16,
                ),
                labelText: 'Confirmação da Senha',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
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
                        _confirmPasswordVisible = !_confirmPasswordVisible;
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
            space40,
            ElevatedButton(
              child: Text(
                'Salvar',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
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
                }
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var resp = await _alterarSenha();
                  showModalCongrats(
                    context,
                    resp,
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
                  50,
                ),
              ),
            ),
          ],
        ),
      );
}

final space40 = SizedBox(
  height: 40,
);
final space16 = SizedBox(
  height: 16,
);
final spaceTopHeader = SizedBox(
  height: 60,
);

_imageHero(String urlImage) => SizedBox(
      width: 380,
      height: 270,
      child: Image.asset(
        urlImage,
        fit: BoxFit.contain,
      ),
    );

_textHero(String text) => SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w100,
        ),
      ),
      width: 400,
    );

showModalCongrats(BuildContext context, String resp) {
  bool isError = resp.contains('Erro');
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
      Get.offNamed(Routes.welcomeScreen);
    },
  );
  Widget errorButton = TextButton(
    child: Text(
      "Tente novamente",
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
            isError
                ? 'assets/images/error.png'
                : 'assets/images/congratulations.png',
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          "Senha",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    content: Text(
      resp,
      textAlign: TextAlign.center,
    ),
    actionsAlignment: MainAxisAlignment.center,
    contentPadding: EdgeInsets.all(24),
    actionsPadding: EdgeInsets.only(bottom: 16),
    actions: [
      isError ? errorButton : okButton,
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
