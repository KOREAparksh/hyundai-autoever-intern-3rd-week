import 'package:app/controller/screen/noti_controller.dart';
import 'package:app/models/notification/notification_data.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_listview/notification_listview.dart';
import 'package:notification_listview/notification_tile.dart';

class NotiScreen extends StatelessWidget {
  NotiScreen({Key? key}) : super(key: key);

  final _title = "알림화면";
  final controller = Get.put(NotiController());

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
      body: Obx(
        () => Center(
          child: (controller.isLoading.isTrue)
              ? Center(child: CircularProgressIndicator())
              : _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return (controller.list.isNotEmpty)
        ? NotificationListView<NotificationData>(
            elements: controller.list,
            hasHeader: true,
            groupBy: (NotificationData element) => element.notiTileType,
            onTapSearch: () {},
            indexItemBuilder: (context, e, i) => NotiListViewTile(
              isNew: e.isNew,
              title: e.title,
              content: e.content,
              notiTileType: e.notiTileType,
              onTapDelete: () => print("tap delete button"),
            ),
          )
        : _nothing();
  }

  Widget _nothing() {
    return Center(
      child: Text(
        "알림이 없습니다.",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
    );
  }
}
