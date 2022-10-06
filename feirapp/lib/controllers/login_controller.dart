import 'package:get/get.dart';
import 'package:feirapp/models/dtos/login_dto.dart';
import 'package:feirapp/models/dtos/user_login_dto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:feirapp/data/repository/login_repo.dart';

class LoginController extends GetxController with StateMixin {
  final LoginRepo loginRepo;
  LoginController({
    required this.loginRepo,
  });

  static const storage = FlutterSecureStorage();
  UserLoginDto? _user;

  UserLoginDto? get user => _user;

  Future<void> postAuth(LoginDTO login) async {
    Response response = await loginRepo.postAuth(login);
    if (response.statusCode == 200) {
      _user = UserLoginDto.fromMap(response.body);
      _saveToken();
      update();
    } else {}
  }

  Future<void> logout() async {
    // to save token in local storage
    await storage.delete(key: 'token');
    _user != null ? _user!.token = '' : '';
    update();
  }

  _saveToken() async {
    // to save token in local storage
    await storage.write(key: 'token', value: user!.token);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }
}
