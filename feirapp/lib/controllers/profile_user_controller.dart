import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/data/repository/profile_user_repo.dart';
import 'package:feirapp/models/profile_user_model.dart';
import 'package:get/get.dart';

class ProfileUserController extends GetxController {
  final ProfileUserRepo profileUserRepo;

  ProfileUserController({
    required this.profileUserRepo,
  });

  List<ProfileUserModel> _infoProfileUser = [];
  List<ProfileUserModel> get infoProfileUser => _infoProfileUser;

  var loginController = Get.find<LoginController>();

  Future<void> getInfoProfile() async {
    Response response =
        await profileUserRepo.getInfoProfileUser(loginController.user.id);
    if (response.statusCode == 200) {
      _infoProfileUser = response.body
          .map<ProfileUserModel>(
            (e) => ProfileUserModel.fromMap(e),
          )
          .toList();
      update();
    } else {}
  }
}
