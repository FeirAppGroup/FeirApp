// ignore_for_file: prefer_const_constructors

import 'package:feirapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderIconTitleWidget extends StatelessWidget {
  final String text;
  final dynamic route;
  const HeaderIconTitleWidget(
      {Key? key, required this.text, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Get.offNamed(route);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        Container(width: 10),
        Text(
          text,
          style: TextStyle(
            color: AppColors.textStyle,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
