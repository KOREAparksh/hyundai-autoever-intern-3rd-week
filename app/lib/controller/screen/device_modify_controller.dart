import 'package:app/controller/base_controller.dart';
import 'package:app/dto/device_dto/device_dto.dart';
import 'package:app/dto/push_group_dto/push_group_dto.dart';
import 'package:app/service/api/device/device_api.dart';
import 'package:app/service/api/push_group/push_group_api.dart';
import 'package:app/service/custom_dio.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class DeviceModifyController extends BaseController {
  RxBool isLoading = true.obs;
  RxList<PushGroupDto> list = <PushGroupDto>[].obs;
  final String userId;

  DeviceModifyController(this.userId);

  @override
  void onInit() async {
    super.onInit();
    initPushGroup(userId);
  }

  Future<void> initPushGroup(String userId) async {
    CustomDio customDio = CustomDio(autoDialog: false);
    PushGroupApi pushGroupApi = PushGroupApi(customDio.dio);
    try {
      final result = await pushGroupApi.getPushGroup(userId);
      list.addAll(result.data);
      await Future.delayed(Duration(milliseconds: 300));
      isLoading(false);
    } on DioError catch (e) {
      _showDialog(main: e.response?.data ?? "PushGroup을 가져올 수 없습니다");
      Get.back();
    } catch (e) {
      print("Error: " + e.toString());
      _showDialog(main: e.toString());
      Get.back();
    } finally {
      customDio.dio.close();
    }
  }

  void onTapInfoModifiedButton(DeviceDto deviceDto, DeviceDto newDto) async {
    if (deviceDto == newDto) {
      _showDialog(main: "수정된 항목이 없습니다", sub: "변경되지 않았습니다");
      return;
    }

    CustomDio customDio = CustomDio(autoDialog: false);
    DeviceApi deviceApi = DeviceApi(customDio.dio);
    try {
      Get.dialog(Center(child: CircularProgressIndicator()));
      await Future.delayed(Duration(milliseconds: 400));
      await deviceApi.updateDevice(newDto);
      if (Get.isDialogOpen == true) Get.back();
      _showDialog(main: "변경되었습니다");
    } on DioError catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      print("DioError: " +
          (e.response?.statusCode.toString() ?? "") +
          " : " +
          e.message);
      _showDialog(main: e.response?.data ?? "입력값이 올바르지 않습니다.");
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      print("Error: " + e.toString());
      _showDialog(main: e.toString());
    } finally {
      customDio.dio.close();
    }
  }

  void onTapPushGroupModifiedButton() async {
    List<String> idList = [];
    list.forEach((element) {
      if (element.isCheck) idList.add(element.pushGroupId);
    });
    print(idList);
    CustomDio customDio = CustomDio(autoDialog: false);
    PushGroupApi pushGroupApi = PushGroupApi(customDio.dio);
    try {
      Get.dialog(Center(child: CircularProgressIndicator()));
      await Future.delayed(Duration(milliseconds: 400));
      await pushGroupApi.updatePushGroup(userId, idList);
      if (Get.isDialogOpen == true) Get.back();
      _showDialog(main: "변경되었습니다.");
    } on DioError catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      print(e.response);
      _showDialog(main: e.response?.data ?? "PushGroup을 수정할 수 없습니다");
    } catch (e) {
      if (Get.isDialogOpen == true) Get.back();
      print("Error: " + e.toString());
      _showDialog(main: e.toString());
    } finally {
      customDio.dio.close();
    }
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
}
