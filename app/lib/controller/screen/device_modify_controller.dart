import 'package:app/controller/base_controller.dart';
import 'package:app/dto/device_dto/device_dto.dart';
import 'package:app/dto/push_group_dto/push_group_dto.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceModifyController extends BaseController {
  void onTapInfoModifiedButton(DeviceDto deviceDto, DeviceDto newDto) {
    if (deviceDto == newDto) {
      showDialog(
        context: Get.context!,
        builder: (_) => CustomDialog(
          mainTitle: "수정된 항목이 없습니다.",
          subTitle: "변경되지 않았습니다.",
          dialogType: DialogType.OK,
          positiveButtonText: "확인",
          onTapPositive: () => Get.back(),
        ),
      );
      return;
    }

    //Todo: 통신
    showDialog(
      context: Get.context!,
      builder: (_) => CustomDialog(
        mainTitle: "변경되었습니다.",
        dialogType: DialogType.OK,
        positiveButtonText: "확인",
        onTapPositive: () => Get.back(),
      ),
    );

    //Todo: device_register 컨트롤러 setstate한번 해줘야함
  }

  void onTapPushGroupModifiedButton() {
    //통신
    showDialog(
      context: Get.context!,
      builder: (_) => CustomDialog(
        mainTitle: "변경되었습니다.",
        dialogType: DialogType.OK,
        positiveButtonText: "확인",
        onTapPositive: () => Get.back(),
      ),
    );
    return;
  }

  void onChangeCheckbox(bool? v, int i) {
    if (v != null) list[i].isCheck = v;
    list.refresh();
  }

  //Todo:더미
  RxList<PushGroupDto> list = <PushGroupDto>[
    PushGroupDto("1", "pushGroup1", true),
    PushGroupDto("2", "pushGroup2", false),
    PushGroupDto("3", "pushGroup3", true),
  ].obs;
}
