import 'package:feirapp/controllers/login_controller.dart';
import 'package:feirapp/controllers/my_cart_controller.dart';
import 'package:feirapp/controllers/product_controller.dart';
import 'package:feirapp/controllers/profile_user_controller.dart';
import 'package:feirapp/controllers/property_controller.dart';
import 'package:feirapp/data/api/api_client.dart';
import 'package:feirapp/data/repository/login_repo.dart';
import 'package:feirapp/data/repository/my_cart_repo.dart';
import 'package:feirapp/data/repository/product_repo.dart';
import 'package:feirapp/data/repository/profile_user_repo.dart';
import 'package:feirapp/data/repository/property_repo.dart';
import 'package:feirapp/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => LoginRepo(apiClient: Get.find()));
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => PropertyRepo(apiClient: Get.find()));
  Get.lazyPut(() => ProfileUserRepo(apiClient: Get.find()));
  Get.lazyPut(() => MyCartRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => LoginController(loginRepo: Get.find()));
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => PropertyController(propertyRepo: Get.find()));
  Get.lazyPut(() => ProfileUserController(profileUserRepo: Get.find()));
  Get.lazyPut(() => MyCartController(myCartRepo: Get.find()));
}
