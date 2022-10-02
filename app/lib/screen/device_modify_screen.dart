import 'package:app/controller/device_modify_controller.dart';
import 'package:app/dto/device_dto.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:app/widget/device_info_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceModifyScreen extends StatelessWidget {
  DeviceModifyScreen({
    Key? key,
    required this.deviceDto,
  }) : super(key: key);

  final _title = "모바일기기 수정하기";
  final DeviceDto deviceDto;
  final controller = Get.put(DeviceModifyController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: _title, hasBack: true, hasNoti: false),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: DeviceInfoField(
                deviceDto: deviceDto,
                buttonText: "수정",
                onTapButton: (newDto) =>
                    controller.onTapAddButton(deviceDto, newDto),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
