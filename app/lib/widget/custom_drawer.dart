import 'package:app/const/color.dart';
import 'package:app/const/route.dart';
import 'package:app/controller/base_controller.dart';
import 'package:app/controller/screen/device_register_controller.dart';
import 'package:app/controller/screen/push_history_controller.dart';
import 'package:app/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key, this.baseController}) : super(key: key);

  final BaseController? baseController;

  //asset
  final _logo = "assets/autoever_logo.png";

  //size
  final _logoHeight = 30.0;
  final _profileRadius = 40.0;
  final _profileIconSize = 60.0;

  //marginpadding
  final _bodySideMargin = 15.0;
  final _bodyBottomMargin = 50.0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(left: _bodySideMargin, right: _bodySideMargin),
        child: Column(
          children: [
            _drawerHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    (Get.context!.isPhone)
                        ? Container()
                        : _ThirdTile(
                            route: TabletNavigator.homeScreen,
                            title: "홈",
                            baseController: baseController,
                          ),
                    _pushTile(),
                    _Dummy(title: "Production"),
                    _Dummy(title: "Order"),
                    _Dummy(title: "Progress"),
                    _Dummy(title: "상태"),
                    _Dummy(title: "Quality"),
                    _Dummy(title: "Equipment"),
                    _Dummy(title: "공통"),
                    SizedBox(height: _bodyBottomMargin),
                  ],
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget _pushTile() {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text("모바일공통"),
      initiallyExpanded: true,
      children: [
        ExpansionTile(
          title: Text("푸시알람"),
          initiallyExpanded: true,
          children: [
            _ThirdTile(
              title: "모바일기기등록",
              baseController: baseController,
              route: kRoute.DEVICE_REGISTER,
            ),
            _ThirdTile(
              title: "푸시알람전송이력",
              baseController: baseController,
              route: kRoute.PUSH_HISTORY,
            ),
          ],
        ),
        ExpansionTile(
          title: Text("Dummy"),
        )
      ],
    );
  }

  Widget _drawerHeader() {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Image.asset(_logo, height: _logoHeight),
          Expanded(
            child: Row(
              children: [
                CircleAvatar(
                  radius: _profileRadius,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: _profileIconSize,
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "ParkSeunghan",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("tmdgks22222@gmail.com",
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ThirdTile extends StatelessWidget {
  const _ThirdTile({
    Key? key,
    this.baseController,
    required this.title,
    required this.route,
  }) : super(key: key);

  final BaseController? baseController;
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    print(route);
    return (Get.context!.isPhone) ? _mobile() : _tablet();
  }

  Widget _mobile() {
    return Container(
      color: _color(),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: (Get.currentRoute == route ||
                    BaseController.route.value == route)
                ? Colors.white
                : null,
          ),
        ),
        contentPadding: EdgeInsets.only(left: 50),
        onTap: () async {
          if (Get.context!.isPhone) {
            (Get.currentRoute == kRoute.HOME)
                ? Get.toNamed(route)
                : Get.offNamed(route);
            baseController?.closeDrawer();
          } else {
            if (route == kRoute.PUSH_HISTORY) {
              if (Get.isRegistered<PushHistoryController>() == false) {
                Get.offNamed(route, id: TabletNavigator.key);
                baseController?.changeRoute(TabletNavigator.pushHistoryScreen);
              }
            } else if (route == kRoute.DEVICE_REGISTER) {
              if (Get.isRegistered<DeviceRegisterController>() == false) {
                Get.offNamed(route, id: TabletNavigator.key);
                baseController
                    ?.changeRoute(TabletNavigator.deviceRegisterScreen);
              }
            } else {
              if (BaseController.route.value != route) {
                Get.offNamed(route, id: TabletNavigator.key);
                baseController?.changeRoute(TabletNavigator.homeScreen);
              }
            }
          }
        },
      ),
    );
  }

  Widget _tablet() {
    return Obx(() => _mobile());
  }

  Color? _color() {
    // (Get.currentRoute == route || BaseController.route.value == route)
    //     ? mainColor
    //     : null
    if (Get.context!.isPhone) {
      if (Get.currentRoute == route) {
        return mainColor;
      }
      return null;
    } else if (BaseController.route.value == route) {
      return mainColor;
    }
    return null;
  }
}

class _Dummy extends StatelessWidget {
  const _Dummy({Key? key, required this.title}) : super(key: key);

  final title;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Text(title),
      children: const [
        ExpansionTile(
          title: Text("Dummy"),
          children: [
            ListTile(title: Text("Dummy")),
            ListTile(title: Text("Dummy")),
            ListTile(title: Text("Dummy")),
          ],
        ),
        ExpansionTile(
          title: Text("Dummy"),
          children: [
            ListTile(title: Text("Dummy")),
            ListTile(title: Text("Dummy")),
            ListTile(title: Text("Dummy")),
          ],
        ),
        ExpansionTile(
          title: Text("Dummy"),
          children: [
            ListTile(title: Text("Dummy")),
            ListTile(title: Text("Dummy")),
            ListTile(title: Text("Dummy")),
          ],
        ),
      ],
    );
  }
}
