import 'package:app/const/route.dart';
import 'package:app/controller/screen/main_controller.dart';
import 'package:app/screen/main_screen.dart';
import 'package:app/screen/push_history_screen.dart';
import 'package:app/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'device_register_screen.dart';

class MainWrapper extends GetView<MainController> {
  const MainWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, __) {
      if (Get.context!.isPhone) {
        return MainScreen();
      }
      return Row(
        children: [
          CustomDrawer(baseController: controller),
          Container(width: 1, color: Colors.black),
          Expanded(
            child: Navigator(
              key: Get.nestedKey(TabletNavigator.key),
              onGenerateRoute: (settings) {
                if (settings.name == kRoute.DEVICE_REGISTER) {
                  return GetPageRoute(
                    fullscreenDialog: true,
                    routeName: TabletNavigator.deviceRegisterScreen,
                    page: () => DeviceRegisterScreen(),
                  );
                } else if (settings.name == kRoute.PUSH_HISTORY) {
                  return GetPageRoute(
                    fullscreenDialog: true,
                    routeName: TabletNavigator.pushHistoryScreen,
                    page: () => PushHistoryScreen(),
                  );
                } else {
                  return GetPageRoute(
                    fullscreenDialog: true,
                    routeName: TabletNavigator.homeScreen,
                    page: () => MainScreen(),
                  );
                }
              },
            ),
          ),
        ],
      );
    });
  }
}
