import 'package:feirapp/data/api/api_client.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:get/get.dart';

class MyCartRepo extends GetxService {
  final ApiClient apiClient;
  MyCartRepo({
    required this.apiClient,
  });

  //busca todos os pedidos do usuário logado
  Future<Response> getMyCartUser(String token) async {
    apiClient.token = token;
    return await apiClient.getData(AppConstants.PEDIDOS_USER_LOGED);
  }
}
