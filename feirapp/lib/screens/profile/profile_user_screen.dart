// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/controllers/profile_user_controller.dart';
import 'package:feirapp/models/profile_user_model.dart';
import 'package:feirapp/utils/app_colors.dart';
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

  Future<void> carregaInfoProfile() async {
    profile = await Get.find<ProfileUserController>().getInfoProfile(
      loginController.user!.id,
      loginController.user!.token,
    );
    //TODO: aqui tenho que verificar se o token ainda e null e se a request retornar a exception tenho que exibir a mensagem e a tela de login novamente
    setState(() {
      isLoading = false;
    });
  }

  @override
  initState() {
    carregaInfoProfile();
    super.initState();
  }

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
              Get.back(); //Itredirect  after 3 second
            },
          ),
        ],
        title: const Text('Perfil'),
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
            ))
          : Center(
              child: Text(
                profile!.nome,
              ),
            ),
    );
  }
}
