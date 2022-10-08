import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/controllers/profile_user_controller.dart';
import 'package:feirapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginController = Get.find<LoginController>();
    var profileController = Get.find<ProfileUserController>();

    if (loginController.user != null) {
      print('não é nulo');
      Get.find<ProfileUserController>().getInfoProfile(
        loginController.user!.id,
        loginController.user!.token,
      );
    } else {
      print('entrou');
      loginController.logout();
    }

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
      body: Center(
        child: Text(
          profileController.infoProfileUser != null
              ? profileController.infoProfileUser!.nome
              : '',
        ),
      ),
    );
  }
}
