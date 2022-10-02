import 'package:app/controller/base_controller.dart';
import 'package:app/dto/push_history_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PushHistoryController extends BaseController {
  final List<PushHistoryDto> contentsList = <PushHistoryDto>[].obs;
  final userIdController = TextEditingController();
  final userNameController = TextEditingController();
  final deviceIdController = TextEditingController();
  final pushTitleController = TextEditingController();
  final readStates = ["전체", "확인", "미확인"];
  RxInt readStatesIndex = 0.obs;
  RxBool isOrderActive = false.obs;
  RxBool isSearchActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    list.forEach((element) => contentsList.add(element));
  }

  @override
  void onClose() {
    super.onClose();
    userIdController.dispose();
    userNameController.dispose();
    deviceIdController.dispose();
    pushTitleController.dispose();
  }

  void onTapOrder() {
    final temp = List.from(contentsList.reversed);
    contentsList.clear();
    temp.forEach((element) => contentsList.add(element));
    (isOrderActive.isTrue) ? isOrderActive(false) : isOrderActive(true);
  }

  void onTapInit() {
    contentsList.clear();
    userIdController.clear();
    deviceIdController.clear();
    deviceIdController.clear();
    pushTitleController.clear();
    readStatesIndex(0);
    isSearchActive(false);
    (isOrderActive.isTrue)
        ? list.reversed.forEach((element) => contentsList.add(element))
        : list.forEach((element) => contentsList.add(element));
    Get.back();
  }

  void onTapSearchDialogPositive() {
    final _userId = userIdController.text.toLowerCase();
    final _userName = userNameController.text.toLowerCase();
    final _deviceId = deviceIdController.text.toLowerCase();
    final _pushTitle = pushTitleController.text.toLowerCase();
    final _state = (readStatesIndex == 0)
        ? ""
        : (readStatesIndex == 1)
            ? "y"
            : "n";

    contentsList.clear();
    if (isOrderActive.isTrue) {
      list.reversed.forEach((element) {
        if (element.userId.toLowerCase().contains(_userId) &&
            element.userName.toLowerCase().contains(_userName) &&
            element.deviceId.toLowerCase().contains(_deviceId) &&
            element.pushTitle.toLowerCase().contains(_pushTitle) &&
            element.sentState.toLowerCase().contains(_state)) {
          contentsList.add(element);
        }
      });
    } else {
      list.forEach((element) {
        if (element.userId.toLowerCase().contains(_userId) &&
            element.userName.toLowerCase().contains(_userName) &&
            element.deviceId.toLowerCase().contains(_deviceId) &&
            element.pushTitle.toLowerCase().contains(_pushTitle) &&
            element.sentState.toLowerCase().contains(_state)) {
          contentsList.add(element);
        }
      });
    }

    isSearchActive(true);
    if (_userId == "" &&
        _userName == "" &&
        _deviceId == "" &&
        _pushTitle == "" &&
        _state == "") {
      isSearchActive(false);
    }
    Get.back();
  }

  void onTapSearchDialogNegative() {
    Get.back();
  }

  void onTapSearchFilterAll() => readStatesIndex(0);

  void onTapSearchFilterStateTrue() => readStatesIndex(1);

  void onTapSearchFilterStateFalse() => readStatesIndex(2);

  final List<PushHistoryDto> list = [
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter",
      pushContent: "이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 05, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 05, 12, 04, 00),
      sentState: "N",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter",
      pushContent: "이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 05, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 05, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter",
      pushContent: "이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 05, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 05, 12, 04, 00),
      sentState: "N",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "N",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter2",
      pushContent: "2이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 07, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter2",
      pushContent: "2이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 07, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter2",
      pushContent: "2이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 07, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter2",
      pushContent: "2이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 07, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "2",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "iphone",
      pushTitle: "iphone",
      pushContent: "steve jobs",
      pushDateTime: DateTime.utc(2022, 08, 15),
      sentDateTime: DateTime.utc(2022, 08, 15),
      sentState: "N",
    ),
    PushHistoryDto(
      userId: "2",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "iphone",
      pushTitle: "iphone",
      pushContent: "steve jobs",
      pushDateTime: DateTime.utc(2022, 08, 15),
      sentDateTime: DateTime.utc(2022, 08, 15),
      sentState: "N",
    ),
    PushHistoryDto(
      userId: "2",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "iphone",
      pushTitle: "iphone",
      pushContent: "steve jobs",
      pushDateTime: DateTime.utc(2022, 08, 15),
      sentDateTime: DateTime.utc(2022, 08, 15),
      sentState: "N",
    ),
    PushHistoryDto(
      userId: "2",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "iphone",
      pushTitle: "iphone",
      pushContent: "steve jobs",
      pushDateTime: DateTime.utc(2022, 08, 15),
      sentDateTime: DateTime.utc(2022, 08, 15),
      sentState: "N",
    ),
  ];
}
