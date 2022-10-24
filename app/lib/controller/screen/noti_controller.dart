import 'package:app/controller/base_controller.dart';
import 'package:app/models/notification/notification_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notification_listview/notification_type.dart';
import 'package:app/main.dart';

class NotiController extends BaseController {
  RxBool isLoading = true.obs;
  final List<NotificationData> list = <NotificationData>[].obs;

  @override
  void onInit() async {
    super.onInit();
    flutterLocalNotificationsPlugin.cancelAll();
    print("123");
    await readData();
    var temp = list.reversed.toList();
    list.clear();
    list.addAll(temp);
    isLoading(false);
    print("345");
    readFlag();
  }

  Future<void> readData() async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = database.ref();
    DataSnapshot dataSnapshot = await ref.get();
    print(dataSnapshot.key);
    print(dataSnapshot.value);
    dataSnapshot.children.forEach((e) {
      String title = e.child("title").value.toString();
      String content = e.child("content").value.toString();
      String type = e.child("type").value.toString();
      String isNew = e.child("isNew").value.toString();
      NotiTileType notiTileType = (type == "chat")
          ? NotiTileType.chatting
          : (type == "normal")
              ? NotiTileType.normal
              : NotiTileType.alert;
      list.add(NotificationData(notiTileType, title, content, isNew == "true"));
    });
  }

  Future<void> readFlag() async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = database.ref();
    DataSnapshot dataSnapshot = await ref.get();
    dataSnapshot.children.forEach(
      (e) async {
        String key = e.key.toString();
        DatabaseReference innerRef = database.ref(key);
        await innerRef.update({"isNew": false});
      },
    );
  }
}
