import 'package:flutter/material.dart';
import 'package:notification_listview/notification_type.dart';

class NotificationData {
  final NotiTileType notiTileType;
  final String title;
  final String content;
  final bool isNew;
  final DateTime dateTime;

  NotificationData(this.notiTileType, this.title, this.content, this.isNew)
      : dateTime = DateTime.now();

  @override
  String toString() {
    return 'Temp{title: $title, type: $notiTileType}\n';
  }
}
