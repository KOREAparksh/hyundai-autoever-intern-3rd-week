// ignore_for_file: constant_identifier_names

import 'package:app/screen/device_register_screen.dart';
import 'package:app/screen/main_screen.dart';
import 'package:app/screen/push_history_screen.dart';
import 'package:get/get.dart';

class kRoute {
  const kRoute._();
  static const HOME = "/";
  static const PUSH_HISTORY = "/push/history";
  static const DEVICE_REGISTER = "/push/register";
  static final List<GetPage<dynamic>> pageRoute = [
    GetPage(
      name: HOME,
      page: () => MainScreen(),
    ),
    GetPage(
      name: PUSH_HISTORY,
      page: () => PushHistoryScreen(),
    ),
    GetPage(
      name: DEVICE_REGISTER,
      page: () => DeviceRegisterScreen(),
    ),
  ];
}

class TabletNavigator {
  TabletNavigator._();
  static const String key = "12";
  static const String pushHistoryScreen = kRoute.PUSH_HISTORY;
  static const String deviceRegisterScreen = kRoute.DEVICE_REGISTER;
}
