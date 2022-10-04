import 'package:app/controller/base_controller.dart';
import 'package:app/dto/device_dto/device_dto.dart';
import 'package:app/service/api/device/device_api.dart';
import 'package:app/service/custom_dio.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DeviceAddController extends BaseController {
  void onTapAddButton(DeviceDto newDto) async {
    CustomDio customDio = CustomDio(autoDialog: false);
    DeviceApi deviceApi = DeviceApi(customDio.dio);
    try {
      await deviceApi.postDevice(newDto);
      await _showDialogOk();
      Get.back(result: 2);
      return;
    } on DioError catch (e) {
      print(e.response);
      print(e.response?.statusCode ?? "???");
      await _showDialogError(msg: e.response?.data ?? " d");
    } catch (e) {
      print("Error: " + e.toString());
      await _showDialogError(msg: e.toString());
    } finally {
      customDio.dio.close();
    }

    //Todo: 통신 후 Dialog 띄우기

    //200 잘 날라오면
    // Get.back(result: 4);
  }

  dynamic _showDialogOk() async {
    return await showDialog(
      context: Get.context!,
      builder: (context) {
        return CustomDialog(
          mainTitle: "등록을 완료하였습니다",
          dialogType: DialogType.OK,
          onTapPositive: () => Get.back(),
        );
      },
    );
  }

  dynamic _showDialogError({String msg = "등록을 완료하였습니다"}) async {
    return await showDialog(
      context: Get.context!,
      builder: (context) {
        return CustomDialog(
          mainTitle: msg,
          dialogType: DialogType.OK,
          onTapPositive: () => Get.back(),
        );
      },
    );
  }
}
