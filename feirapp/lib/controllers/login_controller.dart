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

  Future<String> postAuth(LoginDTO login) async {
    Response response = await loginRepo.postAuth(login);
    if (response.statusCode == 200) {
      _user = UserLoginDto.fromMap(response.body);
      _saveTokenAndUserId();
      update();
      return 'Login realizado com sucesso.';
    } else {
      return 'Usuário ou senha inválido!';
    }
  }

  Future<void> logout() async {
    //to remove token of local storage
    await storage.delete(key: 'token');
    _user != null ? _user!.token = '' : '';
    update();
  }

  _saveTokenAndUserId() async {
    // to save token in local storage
    await storage.write(key: 'token', value: user!.token);
    await storage.write(key: 'userId', value: user!.id.toString());
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  Future<String?> getIdUser() async {
    return await storage.read(key: 'userId');
  }

//esta função preenche os dados do usuário para usar nas outras funções do app
  updateInfoUser(UserLoginDto user) {
    _user = user;
    update();
  }
}
