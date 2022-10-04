import 'package:app/controller/base_controller.dart';
import 'package:app/dto/device_dto/device_dto.dart';
import 'package:app/dto/push_group_dto/push_group_dto.dart';
import 'package:app/service/api/device/device_api.dart';
import 'package:app/service/custom_dio.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DeviceModifyController extends BaseController {
  void onTapInfoModifiedButton(DeviceDto deviceDto, DeviceDto newDto) async {
    if (deviceDto == newDto) {
      _showDialog(main: "수정된 항목이 없습니다", sub: "변경되지 않았습니다");
      return;
    }

    CustomDio customDio = CustomDio(autoDialog: false);
    DeviceApi deviceApi = DeviceApi(customDio.dio);
    try {
      await deviceApi.updateDevice(newDto);
      _showDialog(main: "변경되었습니다");
    } on DioError catch (e) {
      print("DioError: " +
          (e.response?.statusCode.toString() ?? "") +
          " : " +
          e.message);
      _showDialog(main: e.response?.data ?? "입력값이 올바르지 않습니다.");
    } catch (e) {
      print("Error: " + e.toString());
      _showDialog(main: e.toString());
    } finally {
      customDio.dio.close();
    }
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

  void _showDialog({required String main, String? sub}) {
    showDialog(
      context: Get.context!,
      builder: (_) => CustomDialog(
        mainTitle: main,
        subTitle: sub,
        dialogType: DialogType.OK,
        positiveButtonText: "확인",
        onTapPositive: () => Get.back(),
      ),
    );
  }

  //Todo:더미
  RxList<PushGroupDto> list = <PushGroupDto>[
    PushGroupDto("1", "pushGroup1", true),
    PushGroupDto("2", "pushGroup2", false),
    PushGroupDto("3", "pushGroup3", true),
  ].obs;
}
