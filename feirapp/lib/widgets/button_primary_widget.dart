// ignore_for_file: prefer_const_constructors

import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  final String text;
  final dynamic route;
  const ButtonPrimaryWidget({Key? key, required this.text, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        Get.offNamed(route);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        primary: AppColors.primaryColor,
        fixedSize: Size(
          380,
          60,
        ),
      ),
    );
  }
}
