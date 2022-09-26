import 'package:feirapp/controllers/product_controller.dart';
import 'package:feirapp/controllers/property_controller.dart';
import 'package:feirapp/data/api/api_client.dart';
import 'package:feirapp/data/repository/product_repo.dart';
import 'package:feirapp/data/repository/property_repo.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => PropertyRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => PropertyController(propertyRepo: Get.find()));
}
