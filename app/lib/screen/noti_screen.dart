import 'package:app/controller/screen/noti_controller.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Text("알림화면"),
      ),
    );
  }
}
