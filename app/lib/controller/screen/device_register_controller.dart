import 'package:app/controller/base_controller.dart';
import 'package:app/controller/screen/device_add_controller.dart';
import 'package:app/dto/device_dto/device_dto.dart';
import 'package:app/screen/device_add_screen.dart';
import 'package:app/screen/device_modify_screen.dart';
import 'package:app/service/api/device/device_api.dart';
import 'package:app/service/custom_dio.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DeviceRegisterController extends BaseController {
  final List<DeviceDto> list = <DeviceDto>[];
  final RxList<DeviceDto> contentList = <DeviceDto>[].obs;
  final userIdController = TextEditingController();
  final deviceIdController = TextEditingController();
  final deviceController = TextEditingController();
  RxBool isSearchActive = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getAllDeviceData();
    contentList.addAll(list);
  }

  @override
  void onClose() {
    super.onClose();
    userIdController.dispose();
    deviceIdController.dispose();
    deviceController.dispose();
  }

  Future<void> getAllDeviceData() async {
    CustomDio customDio = CustomDio();
    DeviceApi deviceApi = DeviceApi(customDio.dio);
    try {
      final result = await deviceApi.getAllDevice();
      list.clear();
      list.addAll(result.data);
    } on DioError catch (e) {
      print("DioError: " +
          (e.response?.statusCode.toString() ?? "") +
          " : " +
          e.message);
      _showDialog();
    } catch (e) {
      print("Error: " + e.toString());
    } finally {
      customDio.dio.close();
    }
  }

  void onTapTile(int i) {
    Get.to(() => DeviceModifyScreen(deviceDto: contentList[i]));
  }

  void onTapAddButton() async {
    int result = await Get.to(() => DeviceAddScreen());
    print("d");
    if (result == 2) await getAllDeviceData();
    contentList.clear();
    contentList.addAll(list);
  }

  void onTapSearchInit() {
    contentList.clear();
    userIdController.clear();
    deviceIdController.clear();
    deviceController.clear();
    isSearchActive(false);
    list.forEach((element) => contentList.add(element));
    Get.back();
  }

  void onTapSearchDialogPositive() {
    String _userId = userIdController.text.toLowerCase();
    String _deviceId = deviceIdController.text.toLowerCase();
    String _deviceKind = deviceController.text.toLowerCase();
    contentList.clear();
    list.forEach((element) {
      if (element.userId.toLowerCase().contains(_userId) &&
          element.deviceId.toLowerCase().contains(_deviceId) &&
          element.deviceKind.toLowerCase().contains(_deviceKind)) {
        contentList.add(element);
      }
    });
    isSearchActive(true);
    if (_userId == "" && _deviceId == "" && _deviceKind == "") {
      isSearchActive(false);
    }
    Get.back();
  }

  void onTapSearchDialogNegative() {
    Get.back();
  }

  void onTapDelete(int i) async {
    String userId = contentList[i].userId;
    String deviceId = contentList[i].deviceId;
    CustomDio customDio = CustomDio();
    DeviceApi deviceApi = DeviceApi(customDio.dio);
    try {
      await deviceApi.deleteDevice(userId, deviceId);
      await getAllDeviceData();
      contentList.clear();
      contentList.addAll(list);
    } on DioError catch (e) {
      print("DioError: " +
          (e.response?.statusCode.toString() ?? "") +
          " : " +
          e.message);
      await _showDialog();
    } catch (e) {
      print("Error: " + e.toString());
    } finally {
      customDio.dio.close();
    }
  }

  dynamic _showDialog() {
    return showDialog(
      context: Get.context!,
      builder: (context) {
        return CustomDialog(
          mainTitle: "모바일기기정보를 받아오지 못했습니다",
          subTitle: "메인화면으로 이동합니다",
          dialogType: DialogType.OK,
          onTapPositive: () => Get.back(),
        );
      },
    );
  }
}
