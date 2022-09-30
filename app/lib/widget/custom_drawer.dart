import 'package:app/const/Color.dart';
import 'package:app/const/route.dart';
import 'package:app/controller/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key, this.baseController}) : super(key: key);

  final BaseController? baseController;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  //asset
  final _logo = "assets/autoever_logo.png";

  //size
  final _logoHeight = 30.0;
  final _profileRadius = 40.0;
  final _profileIconSize = 60.0;

  //marginpadding
  final _bodySideMargin = 15.0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(left: _bodySideMargin, right: _bodySideMargin),
        child: Column(
          children: [
            DrawerHeader(
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
                              "123123",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("345345", overflow: TextOverflow.ellipsis),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExpansionTile(
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
                              baseController: widget.baseController,
                              route: KRoute.DEVICE_REGISTER.name,
                            ),
                            _ThirdTile(
                              title: "푸시알람전송이력",
                              baseController: widget.baseController,
                              route: KRoute.PUSH_HISTORY.name,
                            ),
                          ],
                        ),
                        ExpansionTile(
                          title: Text("Dummy"),
                        )
                      ],
                    ),
                    _Dummy(title: "Production"),
                    _Dummy(title: "Order"),
                    _Dummy(title: "Progress"),
                    _Dummy(title: "상태"),
                    _Dummy(title: "Quality"),
                    _Dummy(title: "Equipment"),
                    _Dummy(title: "공통"),
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
    return Container(
      color: (Get.currentRoute == route) ? mainColor : null,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: (Get.currentRoute == route) ? Colors.white : null,
          ),
        ),
        contentPadding: EdgeInsets.only(left: 50),
        onTap: () {
          (Get.currentRoute == KRoute.HOME.name)
              ? Get.toNamed(route)
              : Get.offNamed(route);
          baseController?.closeDrawer();
        },
      ),
    );
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
