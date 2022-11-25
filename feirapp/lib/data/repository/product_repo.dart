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

  //busca um produto pelo seu id
  Future<Response> getProductById(int id) async {
    return await apiClient.getData(AppConstants.PRODUCTS_URI + '/$id');
  }

  //busca os produtos na promocao
  Future<Response> getProductsOffer() async {
    return await apiClient.getData(AppConstants.PRODUCTS_OFFER_URI);
  }

  //busa o estoque de um produto
  Future<Response> getStockByIdProduct(int idProduct) async {
    return await apiClient.getData(AppConstants.STOCK_PRODUCT_URI + '/$idProduct');
  }
}
