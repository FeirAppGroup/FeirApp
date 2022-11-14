import 'package:feirapp/data/api/api_client.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:get/get.dart';

class MyOrderRepo extends GetxService {
  final ApiClient apiClient;
  MyOrderRepo({
    required this.apiClient,
  });

  //busca todos os pedidos do usuário logado
  Future<Response> getMyCartUser(String token) async {
    apiClient.token = token;
    return await apiClient.getData(AppConstants.ORDERS_BY_USER_URI);
  }

  Future<Response> postMyCart(String body, String token) async {
    apiClient.token = token;
    return await apiClient.postData(AppConstants.POST_ORDER_URI, body);
  }
}
