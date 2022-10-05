import 'package:feirapp/controllers/profile_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);
  onInit() {
    Get.find<ProfileUserController>().getInfoProfile();
  }

  @override
  Widget build(BuildContext context) {
    var profileController = Get.find<ProfileUserController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: profileController.infoProfileUser.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(profileController.infoProfileUser[index].nome),
            );
          },
        ),
      ),
    );
  }
}
