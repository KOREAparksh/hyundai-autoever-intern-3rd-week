import 'dart:convert';

import 'package:app/const/route.dart';
import 'package:app/firebase_options.dart';
import 'package:app/main.dart';
import 'package:app/screen/noti_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

////////////////////////////////Variation////////////////////////////////////

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

const InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
);

////////////////////////////////Function////////////////////////////////////

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Handling a background message: ${message.messageId}");
  print("Handling a background message body: ${message.notification!.body}");
  saveData(
    type: message.data['type'] ?? "normal",
    title: message.notification?.title ?? "null",
    content: message.notification?.body ?? "null",
  );
}

void onTapNotiBackground(RemoteMessage message) {
  if (message.data['type'] == 'chat') {
    Get.toNamed(kRoute.CHATTING, arguments: message.data);
  } else {
    Get.to(() => NotiScreen(), arguments: message.data);
  }
}

Future<void> _firebaseMessagingForegroundHandler(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  String type = message.data['type'] ?? "normal";
  saveData(
    type: message.data['type'] ?? "normal",
    title: notification?.title ?? "null",
    content: notification?.body ?? "null",
  );

  //chat이면 뭉치게
  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
      (type == "chat") ? 123 : notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: android.smallIcon,
          priority: Priority.max,
          styleInformation: (type == "chat")
              ? MessagingStyleInformation(
                  Person(name: "psh"),
                  conversationTitle: notification.title,
                  htmlFormatTitle: true,
                  messages: [
                    Message(
                      notification.body!,
                      DateTime.now(),
                      Person(name: notification.title),
                    ),
                    Message(
                      notification.body!,
                      DateTime.now(),
                      Person(name: notification.title),
                    ),
                    Message(
                      notification.body!,
                      DateTime.now(),
                      Person(name: notification.title),
                    ),
                  ],
                )
              : null,
        ),
      ),
      payload: jsonEncode(message.data).toString(),
    );
  }
}

Future<void> saveData({
  required String type,
  required String title,
  required String content,
}) async {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref =
      database.ref(DateFormat('yyMMddHHmmss').format(DateTime.now()));
  await ref
      .set({"type": type, "title": title, "content": content, "isNew": true});
}

Future<void> settingNotification() async {
  //Firebase core설정
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging
      .getToken(vapidKey: dotenv.get("WEBPUSHKEY"))
      .then((value) => print(value));

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  //noti setting
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) async {
      // FCM 포그라운드 메시지 클릭 액션
      Map<String, dynamic> message =
          jsonDecode(notificationResponse.payload ?? "");
      if (message['type'] == 'chat') {
        Get.toNamed(kRoute.CHATTING, arguments: message);
      } else {
        Get.to(() => NotiScreen(), arguments: message);
      }
    },
  );

  //Foreground 수신 처리
  FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);

  //Background, Terminated 수신 처리
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // 앱이 종료된 상태에서 푸시 알림 클릭하여 열릴 경우 메세지 가져옴
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  // 종료상태에서 클릭한 푸시 알림 메세지 핸들링
  if (initialMessage != null) {
    onTapNotiBackground(initialMessage);
  }
  // 앱이 백그라운드 상태에서 푸시 알림 클릭 하여 열릴 경우 메세지 스트림을 통해 처리
  FirebaseMessaging.onMessageOpenedApp.listen(onTapNotiBackground);
}
