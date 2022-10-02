import 'package:app/controller/base_controller.dart';
import 'package:app/controller/device_add_controller.dart';
import 'package:app/dto/device_dto.dart';
import 'package:app/screen/device_add_screen.dart';
import 'package:app/screen/device_modify_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceRegisterController extends BaseController {
  final RxList<DeviceDto> contentList = <DeviceDto>[].obs;
  final userIdController = TextEditingController();
  final deviceIdController = TextEditingController();
  final deviceController = TextEditingController();
  RxBool isSearchActive = false.obs;

  @override
  void onInit() {
    super.onInit();

    list.forEach((element) => contentList.add(element));
  }

  @override
  void onClose() {
    super.onClose();
    userIdController.dispose();
    deviceIdController.dispose();
    deviceController.dispose();
  }

  void onTapTile(int i) {
    Get.to(() => DeviceModifyScreen(deviceDto: contentList[i]));
  }

  void onTapAddButton() {
    Get.to(() => DeviceAddScreen());
  }

  void onTapSearchInit(/*void Function(void Function() fn) setState2*/) {
    contentList.clear();
    userIdController.clear();
    deviceIdController.clear();
    deviceController.clear();
    isSearchActive(false);
    list.forEach((element) => contentList.add(element));
    // setState2.call(() {});
    Get.back();
  }

  void onTapSearchDialogPositive(
      /*void Function(void Function() fn) setState2*/) {
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
    // setState2.call(() {});

    Get.back();
  }

  void onTapSearchDialogNegative() {
    Get.back();
  }

  void onTapDelete(/*void Function(void Function() fn) setState2,*/ int i) {
    //Todo: Device Delete 통신 필요
    contentList.removeAt(i);
    // setState2.call(() {});
  }

  final List<DeviceDto> list = const [
    DeviceDto("WJKIM", "note10", "device1", "Android", 3, "Y"),
    DeviceDto("WJKIM", "note11", "device2", "Android", 3, "N"),
    DeviceDto("WJKIM", "note12", "device3", "Android", 3, "Y"),
    DeviceDto("asdf", "note13", "device4", "Android", 3, "N"),
    DeviceDto("asdf", "note14", "device5", "Android", 3, "Y"),
    DeviceDto("asdfasdf", "note15", "device6", "Android", 3, "Y"),
    DeviceDto("asdfasdf", "note16", "device7", "Android", 3, "N"),
    DeviceDto("hyj", "note17", "device8", "Android", 3, "Y"),
    DeviceDto("hyj", "note18", "device9", "Android", 3, "Y"),
    DeviceDto("parkseunghan", "note19", "1device1", "Android", 3, "Y"),
    DeviceDto("parkseunghan", "note20", "1device11", "Android", 3, "Y"),
    DeviceDto("parkseunghan", "note21", "1device111", "Android", 3, "Y"),
  ];
}
