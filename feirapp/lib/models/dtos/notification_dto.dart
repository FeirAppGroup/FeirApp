import 'package:flutter/material.dart';

class NotificationDto {
  int id;
  String title;
  String description;
  DateTime date;
  IconData icon;

  NotificationDto({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.icon,
  });
}
