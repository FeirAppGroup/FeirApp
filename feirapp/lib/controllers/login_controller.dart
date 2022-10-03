import 'package:feirapp/models/dtos/login_dto.dart.dart';
import 'package:get/get.dart';

import 'package:feirapp/data/repository/login_repo.dart';

class LoginController extends GetxController with StateMixin {
  final LoginRepo loginRepo;
  LoginController({
    required this.loginRepo,
  });

  String _user = '';

  String get user => _user;

  Future<void> postAuth(LoginDTO login) async {
    Response response = await loginRepo.postAuth(login);
    print(response.statusCode);
    if (response.statusCode == 200) {
      _user = '';
      _user = response.body.toMap<LoginDTO>();
      print(_user);
      update();
    } else {}
  }
}
