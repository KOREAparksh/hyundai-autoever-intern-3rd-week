import 'package:app/controller/base_controller.dart';
import 'package:app/dto/device_dto/device_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceInfoFieldController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final userIdController = TextEditingController();
  final deviceIdController = TextEditingController();
  final deviceDescController = TextEditingController();
  final deviceKindController = TextEditingController();
  final maxCountController = TextEditingController();
  RxBool state = true.obs;

  @override
  void onClose() {
    super.onClose();
    userIdController.dispose();
    deviceIdController.dispose();
    deviceDescController.dispose();
    deviceKindController.dispose();
    maxCountController.dispose();
  }

  void initText(DeviceDto deviceDto) {
    userIdController.text = deviceDto.userId;
    deviceIdController.text = deviceDto.deviceId;
    deviceDescController.text = deviceDto.deviceDescription;
    deviceKindController.text = deviceDto.deviceKind;
    if (deviceDto.maxSentCount != 0) {
      maxCountController.text = deviceDto.maxSentCount.toString();
    }
  }

  void onChangeRadioButton(v) {
    state(v!);
  }

  void onTapButton(void Function(DeviceDto newDto) onTapButton) {
    if (formKey.currentState?.validate() == true) {
      onTapButton.call(
        DeviceDto(
          userIdController.text,
          deviceIdController.text,
          deviceDescController.text,
          deviceKindController.text,
          int.parse(maxCountController.text),
          state.value ? "Y" : "N",
        ),
      );
    }
  }
}
