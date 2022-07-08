import 'package:feirapp/screens/create_new_password_screen.dart';
import 'package:feirapp/screens/home/home_page_screen.dart';
import 'package:feirapp/screens/home/main_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Feirapp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Urbanist',
      ),
      home: const HomePageScreen(),
    );
  }
}
