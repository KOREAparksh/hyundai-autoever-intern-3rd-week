import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

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
                          children: [
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
                    ListTile(title: Text("홈")),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: Text("모바일공통"),
                      children: [
                        ExpansionTile(
                          title: Text("푸시알람"),
                          children: [
                            ListTile(
                              title: Text("모바일기기등록"),
                              onTap: () => Get.toNamed("/push/register"),
                            ),
                            ListTile(
                              title: Text("푸시알람전송이력"),
                              onTap: () => Get.toNamed("/push/history"),
                            ),
                          ],
                        ),
                        _Dummy(),
                        _Dummy(),
                      ],
                    ),
                    ExpansionTile(
                      maintainState: true,
                      tilePadding: EdgeInsets.zero,
                      title: Text("Production"),
                      children: [
                        _Dummy(),
                        _Dummy(),
                        _Dummy(),
                      ],
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: Text("Order"),
                      children: [
                        _Dummy(),
                        _Dummy(),
                        _Dummy(),
                      ],
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: Text("Progress"),
                      children: [
                        _Dummy(),
                        _Dummy(),
                        _Dummy(),
                      ],
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: Text("상태"),
                      children: [
                        _Dummy(),
                        _Dummy(),
                        _Dummy(),
                      ],
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: Text("Quality"),
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: Text("Equipment"),
                    ),
                    ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: Text("공통"),
                    ),
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

class _Dummy extends StatelessWidget {
  const _Dummy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text("Dummy"),
      children: const [
        ListTile(title: Text("Dummy")),
        ListTile(title: Text("Dummy")),
        ListTile(title: Text("Dummy")),
      ],
    );
  }
}
