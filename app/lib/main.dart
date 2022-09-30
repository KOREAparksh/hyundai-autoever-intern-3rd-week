import 'package:app/controller/scaffold_controller.dart';
import 'package:app/screen/device_register_screen.dart';
import 'package:app/screen/main_screen.dart';
import 'package:app/screen/push_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ScaffoldController());
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
        GetPage(name: '/', page: () => MainScreen()),
        GetPage(name: '/push/history', page: () => PushHistoryScreen()),
        GetPage(name: '/push/register', page: () => DeviceRegisterScreen()),
      ],
      initialRoute: "/",
    );
  }
}
