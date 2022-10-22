import 'package:app/controller/screen/noti_controller.dart';
import 'package:app/models/notification/NotificationData.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_listview/notification_listview.dart';
import 'package:notification_listview/notification_tile.dart';

class NotiScreen extends GetView<NotiController> {
  const NotiScreen({Key? key}) : super(key: key);

  final _title = "알림화면";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: CustomAppBar(
        baseController: controller,
        title: _title,
        hasBack: true,
        hasNoti: false,
        hasStar: false,
      ),
      body: Center(
        child: NotificationListView<NotificationData>(
          elements: controller.dummy,
          hasHeader: true,
          groupBy: (NotificationData element) => element.notiTileType,
          onTapSearch: () {},
          indexItemBuilder: (context, e, i) => NotiListViewTile(
            isNew: true,
            title: e.title,
            content: e.content,
            notiTileType: e.notiTileType,
            onTapDelete: () => print("tap delete button"),
          ),
        ),
      ),
    );
  }
}
