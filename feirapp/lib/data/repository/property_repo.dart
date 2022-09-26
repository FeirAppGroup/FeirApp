import 'package:feirapp/data/api/api_client.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:get/get.dart';

class PropertyRepo extends GetxService {
  final ApiClient apiClient;
  PropertyRepo({
    required this.apiClient,
  });

  Future<Response> getPropertys() async {
    return await apiClient.getData(AppConstants.PROPERTY_URI);
  }
}
