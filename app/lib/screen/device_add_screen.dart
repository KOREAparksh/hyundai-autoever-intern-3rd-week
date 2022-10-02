import 'package:app/controller/screen/device_add_controller.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:app/widget/device_info_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceAddScreen extends StatelessWidget {
  DeviceAddScreen({
    Key? key,
  }) : super(key: key);

  final _title = "모바일기기 등록하기";
  final controller = Get.put(DeviceAddController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: _title, hasBack: true, hasNoti: false),
        body: DeviceInfoField(
          onTapButton: controller.onTapAddButton,
          buttonText: "추가",
        ),
      ),
    );
  }
}
