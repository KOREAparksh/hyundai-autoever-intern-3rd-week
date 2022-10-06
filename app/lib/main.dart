import 'package:app/const/route.dart';
import 'package:app/controller/screen/device_register_controller.dart';
import 'package:app/controller/screen/main_controller.dart';
import 'package:app/controller/screen/push_history_controller.dart';
import 'package:app/screen/device_register_screen.dart';
import 'package:app/screen/main_screen.dart';
import 'package:app/screen/push_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: "env");
  Get.put(MainController());
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
        GetPage(
          name: KRoute.HOME.name,
          page: () => MainScreen(),
        ),
        GetPage(
          name: KRoute.PUSH_HISTORY.name,
          page: () => PushHistoryScreen(),
        ),
        GetPage(
          name: KRoute.DEVICE_REGISTER.name,
          page: () => DeviceRegisterScreen(),
        ),
      ],
      initialRoute: KRoute.HOME.name,
    );
  }
}
