import 'package:feirapp/controllers/product_controller.dart';
import 'package:feirapp/controllers/property_controller.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'helper/dependences.dart' as dep;
import 'package:get/get.dart';
import 'routes/routes.dart';

Future<void> main() async {
  //configura as chamadas da api na inicialização
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //carrega as listas de produtos e propriedades na inicialização do app
    Get.find<ProductController>().getProductList();
    Get.find<ProductController>().getProductsOffer();

    Get.find<PropertyController>().getPropertys();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Urbanist',
          useMaterial3: true,
          colorScheme: AppColors.lightColorScheme),
      darkTheme: ThemeData(
          fontFamily: 'Urbanist',
          useMaterial3: true,
          colorScheme: AppColors.darkColorScheme),
      themeMode: ThemeMode.dark,
      title: 'FeirApp',
      initialRoute: Routes.getSplashScreen(),
      getPages: Routes.routes,
      //home: Test(),
    );
  }
}
