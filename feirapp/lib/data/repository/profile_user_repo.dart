import 'package:feirapp/data/api/api_client.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:get/get.dart';

class ProfileUserRepo extends GetxService {
  final ApiClient apiClient;
  ProfileUserRepo({
    required this.apiClient,
  });

  //busca informações do usuário
  Future<Response> getInfoProfileUser(int idUser) async {
    return await apiClient.getData(AppConstants.PRODUCTS_URI + '/$idUser');
  }
}
