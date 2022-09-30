import 'package:app/const/route.dart' as route;
import 'package:app/controller/device_register_controller.dart';
import 'package:app/controller/main_controller.dart';
import 'package:app/controller/push_history_controller.dart';
import 'package:app/screen/device_register_screen.dart';
import 'package:app/screen/main_screen.dart';
import 'package:app/screen/push_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(MainController());
  Get.put(PushHistoryController());
  Get.put(DeviceRegisterController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hyundai Auto-ever App',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: [
        GetPage(name: route.Route.HOME.name, page: () => MainScreen()),
        GetPage(
            name: route.Route.PUSH_HISTORY.name,
            page: () => PushHistoryScreen()),
        GetPage(
            name: route.Route.DEVICE_REGISTER.name,
            page: () => DeviceRegisterScreen()),
      ],
      initialRoute: route.Route.HOME.name,
    );
  }
}
