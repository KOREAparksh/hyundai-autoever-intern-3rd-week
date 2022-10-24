import 'package:app/const/route.dart';
import 'package:app/controller/screen/main_controller.dart';
import 'package:app/controller/screen/noti_controller.dart';
import 'package:app/service/notification_setting.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  //환경변수 파일 설정
  await dotenv.load(fileName: "env");
  WidgetsFlutterBinding.ensureInitialized();

  //화면회전 설정
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //FCM 설정
  settingNotification();

  Get.put(MainController());
  Get.put(NotiController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hyundai Auto-ever App',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: kRoute.pageRoute,
      initialRoute: kRoute.HOME,
    );
  }
}
