import 'package:feirapp/models/dtos/notification_dto.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class ListNotificationDtoMock {
  ListNotificationDtoMock();

  List<NotificationDto> notifications = [
    NotificationDto(
      id: 1,
      title: 'Promoção do dia',
      description: 'Somente hoje',
      date: DateTime(2022, 08, 11),
      icon: Icons.sell_outlined,
    ),
    NotificationDto(
      id: 2,
      title: 'Semana das ofertas',
      description: 'Ofertas em todos os departamentos',
      date: DateTime(2022, 08, 08),
      icon: UniconsLine.wallet,
    ),
    NotificationDto(
      id: 3,
      title: 'Feliz mês de Agosto',
      description: 'Agosto teremos mais ofertas especiais para você !',
      date: DateTime(2022, 08, 01),
      icon: UniconsLine.wind_sun,
    ),
    NotificationDto(
      id: 4,
      title: 'Feliz mês de Agosto/2',
      description: 'Agosto teremos mais ofertas especiais para você !',
      date: DateTime(2022, 08, 01),
      icon: UniconsLine.wind_sun,
    ),
  ];

  getAllNotifications() {
    return notifications;
  }
}
