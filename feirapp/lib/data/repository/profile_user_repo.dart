import 'package:feirapp/data/api/api_client.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:get/get.dart';

class ProfileUserRepo extends GetxService {
  final ApiClient apiClient;
  ProfileUserRepo({
    required this.apiClient,
  });

  //busca informações do usuário
  Future<Response> getInfoProfileUser(int idUser, String token) async {
    apiClient.token = token;
    return await apiClient.getData(AppConstants.USER_URI + '/$idUser');
  }

//cadastra um novo usuário
  Future<Response> registerNewUser(String body) async {
    return await apiClient.postData(AppConstants.USER_URI, body);
  }
}
