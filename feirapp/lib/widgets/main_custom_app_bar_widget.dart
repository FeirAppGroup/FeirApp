// ignore_for_file: prefer_const_constructors

import 'package:feirapp/utils/app_colors.dart';
import 'package:feirapp/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String urlAvatar;
  const MainCustomAppBar({
    Key? key,
    required this.title,
    required this.urlAvatar,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 64,
      leading: Padding(
        padding: EdgeInsets.only(left: Dimensions.width20),
        child: Image.asset(
          urlAvatar,
          width: 40,
          height: 40,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: AppColors.textStyle,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.search_rounded,
            color: AppColors.textStyle,
          ),
          onPressed: () {},
        )
      ],
      backgroundColor: Colors.white,
    );
  }
}
