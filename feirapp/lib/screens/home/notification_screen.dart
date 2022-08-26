import 'package:feirapp/models/dtos/notification_dto.dart';
import 'package:feirapp/models/mock/list_notification_dto_mock.dart';
import 'package:feirapp/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../utils/app_colors.dart';
import '../../utils/dimensions.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late List<NotificationDto> notifications = [];

  @override
  void initState() {
    super.initState();
    notifications = ListNotificationDtoMock().getAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _notificationDate(
                        _formatDate(notifications[index].date),
                      ),
                      _notificationText(
                        notifications[index].title,
                        notifications[index].description,
                        notifications[index].icon,
                      ),
                    ],
                  );
                }),
            dividerLine,
          ],
        ),
      ),
    );
  }

  _appBarWidget() {
    return AppBar(
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
    );
  }

  _notificationIconWidget(IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
      child: Container(
        width: Dimensions.width40,
        height: Dimensions.height45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius40),
          color: AppColors.primaryColorLight,
        ),
        child: Icon(
          icon,
          size: Dimensions.icon30,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  _notificationText(String title, String description, IconData icon) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _notificationIconWidget(icon),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: Dimensions.font18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
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

  _formatDate(DateTime date) {
    String str = '';

    if (date.day.toString().length == 1) {
      str += '0' + date.day.toString() + '/';
    } else {
      str += date.day.toString() + '/';
    }

    if (date.month.toString().length == 1) {
      str += '0' + date.month.toString() + '/';
    } else {
      str += date.month.toString() + '/';
    }

    str += date.year.toString();

    return str;
  }

  _notificationDate(String text) {
    return Container(
      padding: EdgeInsets.only(
        left: Dimensions.height20,
        right: Dimensions.height20,
        top: Dimensions.height20,
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: Dimensions.font16),
      ),
    );
  }

  var dividerLine = Container(
    margin: EdgeInsets.only(top: Dimensions.height10),
    child: Divider(
      color: AppColors.greyColor,
      thickness: 2,
      indent: Dimensions.width20,
      endIndent: Dimensions.width20,
    ),
  );
}
