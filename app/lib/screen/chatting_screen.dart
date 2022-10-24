import 'package:app/controller/screen/chatting_controller.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChattingScreen extends StatelessWidget {
  ChattingScreen({Key? key}) : super(key: key);

  final controller = Get.put(ChattingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        baseController: controller,
        title: "채팅화면",
        hasBack: true,
        hasStar: false,
        hasNoti: false,
      ),
      body: Center(
        child: Text("채팅화면"),
      ),
    );
  }
}
