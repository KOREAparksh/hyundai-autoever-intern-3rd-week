import 'package:app/const/route.dart';
import 'package:app/controller/screen/main_controller.dart';
import 'package:app/controller/screen/noti_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: "env");
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

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
