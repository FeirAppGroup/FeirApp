import 'package:feirapp/data/repository/profile_user_repo.dart';
import 'package:feirapp/models/profile_user_model.dart';
import 'package:get/get.dart';

class ProfileUserController extends GetxController {
  final ProfileUserRepo profileUserRepo;

  ProfileUserController({
    required this.profileUserRepo,
  });

  Future<ProfileUserModel> getInfoProfile(int id, String token) async {
    Response response = await profileUserRepo.getInfoProfileUser(id, token);
    if (response.statusCode == 200) {
      return ProfileUserModel.fromMap(response.body);
    } else {
      return throw Exception('Erro ao buscar dados do usuário.');
    }
  }
}
