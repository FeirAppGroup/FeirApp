import 'package:feirapp/data/api/api_client.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:get/get.dart';

class ProductRepo extends GetxService {
  final ApiClient apiClient;
  ProductRepo({
    required this.apiClient,
  });

  Future<Response> getProductList() async {
    return await apiClient.getData(AppConstants.PRODUCTS_URI);
  }

//lista produtos por categoria
  Future<Response> getProductByCategory(category) async {
    return await apiClient
        .getData(AppConstants.PRODUCTS_CATEGORY_URI + category.toString());
  }
}
