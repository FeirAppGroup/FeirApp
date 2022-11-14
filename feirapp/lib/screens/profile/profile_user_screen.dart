// ignore_for_file: prefer_const_constructors

import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/controllers/profile_user_controller.dart';
import 'package:feirapp/models/profile_user_model.dart';
import 'package:feirapp/routes/routes.dart';
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
    if (loginController.user != null) {
      profile = await Get.find<ProfileUserController>().getInfoProfile(
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
            icon: const Icon(Icons.edit),
            tooltip: 'Editar Informações',
            onPressed: () {
              //TODO: fazer método para editar as informações
            },
          ),
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
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  _space,
                  Text(
                    'Nome: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text('  ${profile!.nome}'),
                  _space,
                  Text(
                    'Email:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text('  ${profile!.email}'),
                  _space,
                  Text(
                    'Telefone:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text('  ${profile!.telefone}'),
                  _space,
                  Text(
                    'Documento:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                      '  ${profile!.cpf}'), //TODO: fazer if para ver qual o documento a pessoa possui
                  _space,
                  Text(
                    'Cep:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text('  ${profile!.cep}'),
                  _space,
                  Divider(
                    thickness: 1,
                    color: AppColors.blackColor.withOpacity(0.2),
                  ),
                ],
              ),
            ),
    );
  }

  var _space = SizedBox(
    height: 20,
  );
}
