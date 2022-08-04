// ignore_for_file: prefer_const_constructors

import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String route;
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.route,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 64,
      leading: IconButton(
        onPressed: () {
          Get.offNamed(route);
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.textStyle,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.textStyle,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
