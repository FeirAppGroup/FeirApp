import 'package:feirapp/models/dtos/login_dto.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:get/get.dart';

import 'package:feirapp/data/api/api_client.dart';

class LoginRepo extends GetxService {
  final ApiClient apiClient;
  LoginRepo({
    required this.apiClient,
  });

  Future<Response> postAuth(LoginDTO login) async {
    return await apiClient.postAuth(AppConstants.AUTH_URI, login);
  }
}
