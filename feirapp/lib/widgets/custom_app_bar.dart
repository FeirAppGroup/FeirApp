// ignore_for_file: prefer_const_constructors
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
      leading: IconButton(
        onPressed: () {
          Get.toNamed(route);
        },
        icon: Icon(
          Icons.arrow_back,
        ),
      ),
      title: Text(
        title,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
