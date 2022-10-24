import 'package:app/controller/base_controller.dart';
import 'package:app/models/notification/notification_data.dart';
import 'package:flutter/material.dart';
import 'package:notification_listview/notification_type.dart';
import 'package:app/main.dart';

class NotiController extends BaseController {
  @override
  void onInit() {
    super.onInit();
    flutterLocalNotificationsPlugin.cancelAll();
  }

  final List<NotificationData> dummy = [
    NotificationData(NotiTileType.alert, "title", "content"),
    NotificationData(NotiTileType.normal, "title", "content"),
    NotificationData(NotiTileType.chatting, "title", "content"),
    NotificationData(NotiTileType.alert, "title", "content"),
    NotificationData(NotiTileType.normal, "title", "content"),
    NotificationData(NotiTileType.chatting, "title", "content"),
    NotificationData(NotiTileType.alert, "title", "content"),
    NotificationData(NotiTileType.normal, "title", "content"),
    NotificationData(NotiTileType.chatting, "title", "content"),
    NotificationData(NotiTileType.alert, "title", "content"),
    NotificationData(NotiTileType.normal, "title", "content"),
  ];
}
