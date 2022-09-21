import 'package:feirapp/screens/orders/orders_screen.dart';
import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Urbanist', useMaterial3: true, colorScheme: AppColors.lightColorScheme),
      darkTheme: ThemeData(fontFamily: 'Urbanist', useMaterial3: true, colorScheme: AppColors.darkColorScheme),
      themeMode: ThemeMode.dark,
      title: 'FeirApp',
      initialRoute: Routes.getSplashScreen(),
      getPages: Routes.routes,
      //home: Test(),
    );
  }
}
