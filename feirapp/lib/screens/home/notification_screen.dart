import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: Criar uma appbar padrão sem rota
        elevation: 0,
        toolbarHeight: 64,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.blackColor),
          ),
        ],
        title: Text(
          'Notificações',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textStyle,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.font20,
          ),
        ),
        backgroundColor: Colors.white,
        leading: BackButton(color: AppColors.textStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _notificationText(),
            _notificationText(),
            _notificationText(),
            _notificationText(),
          ],
        ),
      ),
    );
  }

  _notificationText() {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
                child: Container(
                  width: Dimensions.width40,
                  height: Dimensions.height45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius40),
                    color: AppColors.primaryColorLight,
                  ),
                  child: Icon(
                    Icons.discount_sharp,
                    size: Dimensions.icon30,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Titulo',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Dimensions.font18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Descrição',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Dimensions.font12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
