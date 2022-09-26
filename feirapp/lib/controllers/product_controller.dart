import 'package:feirapp/data/repository/product_repo.dart';
import 'package:feirapp/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin {
  final ProductRepo productRepo;

  ProductController({
    required this.productRepo,
  });

  List<dynamic> _productList = [];
  List<dynamic> _productCategoryFrutas = [];
  List<dynamic> _productCategoryLegumes = [];
  List<dynamic> _productCategoryHortalicas = [];

  List<dynamic> get productList => _productList;
  List<dynamic> get productCategoryFrutas => _productCategoryFrutas;
  List<dynamic> get productCategoryLegumes => _productCategoryLegumes;
  List<dynamic> get productCategoryHortalicas => _productCategoryHortalicas;

  Future<void> getProductList() async {
    Response response = await productRepo.getProductList();
    if (response.statusCode == 200) {
      _productList = [];
      _productList = response.body
          .map<ProductModel>(
            (e) => ProductModel.fromMap(e),
          )
          .toList();
      update();
    } else {}
  }

  Future<void> getProductByCategoryFrutas() async {
    Response response = await productRepo.getProductByCategory('Frutas');

    if (response.statusCode == 200) {
      _productCategoryFrutas = [];
      _productCategoryFrutas = response.body
          .map<ProductModel>(
            (e) => ProductModel.fromMap(e),
          )
          .toList();
      update();
    } else {}
  }

  Future<void> getProductByCategoryLegumes() async {
    Response response = await productRepo.getProductByCategory('Legumes');

    if (response.statusCode == 200) {
      _productCategoryLegumes = [];
      _productCategoryLegumes = response.body
          .map<ProductModel>(
            (e) => ProductModel.fromMap(e),
          )
          .toList();
      update();
    } else {}
  }

  Future<void> getProductByCategoryHortalicas() async {
    Response response = await productRepo.getProductByCategory('verdura');

    if (response.statusCode == 200) {
      _productCategoryHortalicas = [];
      _productCategoryHortalicas = response.body
          .map<ProductModel>(
            (e) => ProductModel.fromMap(e),
          )
          .toList();
      update();
    } else {}
  }
}