import 'package:app/const/Color.dart';
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

  final _infoHeight = 500.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(title: _title, hasBack: true, hasNoti: false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: _infoHeight,
                child: DeviceInfoField(
                  deviceDto: deviceDto,
                  buttonText: "수정",
                  onTapButton: (newDto) =>
                      controller.onTapInfoModifiedButton(deviceDto, newDto),
                ),
              ),
              Container(height: 1, color: boxBorderLight),
              SizedBox(height: 20),
              _pushGroupList(),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: controller.onTapPushGroupModifiedButton,
                  child: Text("수정"),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pushGroupList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.list.length,
      itemBuilder: (_, i) => ListTile(
        title: Text(controller.list[i].pushGroupName),
        subtitle: Text(controller.list[i].pushGroupId),
        trailing: Obx(
          () => Checkbox(
            value: controller.list[i].isCheck,
            onChanged: (v) => controller.onChangeCheckbox(v, i),
          ),
        ),
      ),
    );
  }
}
