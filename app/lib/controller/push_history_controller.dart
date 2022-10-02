import 'package:app/controller/base_controller.dart';
import 'package:app/dto/push_history_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PushHistoryController extends BaseController {
  final List<PushHistoryDto> contentsList = [];
  final userIdController = TextEditingController();
  final userNameController = TextEditingController();
  final deviceIdController = TextEditingController();
  final pushTitleController = TextEditingController();
  final readStates = ["전체", "확인", "미확인"];
  int readStatesIndex = 0;
  bool isOrderActive = false;
  bool isSearchActive = false;

  void onTapOrder(void Function(void Function() fn) setState2) {
    final temp = List.from(contentsList.reversed);
    contentsList.clear();
    temp.forEach((element) => contentsList.add(element));
    isOrderActive = (isOrderActive) ? false : true;
    setState2.call(() {});
  }

  void onTapInit(void Function(void Function() fn) setState2) {
    contentsList.clear();
    userIdController.clear();
    deviceIdController.clear();
    deviceIdController.clear();
    pushTitleController.clear();
    readStatesIndex = 0;
    isSearchActive = false;
    (isOrderActive)
        ? list.reversed.forEach((element) => contentsList.add(element))
        : list.forEach((element) => contentsList.add(element));
    setState2.call(() {});
    Get.back();
  }

  void onTapSearchDialogPositive(void Function(void Function() fn) setState2) {
    final _userId = userIdController.text;
    final _userName = userNameController.text;
    final _deviceId = deviceIdController.text;
    final _pushTitle = pushTitleController.text;
    final _state = (readStatesIndex == 0)
        ? ""
        : (readStatesIndex == 1)
            ? "Y"
            : "N";

    contentsList.clear();
    if (isOrderActive) {
      list.reversed.forEach((element) {
        if (element.userId.contains(_userId) &&
            element.userName.contains(_userName) &&
            element.deviceId.contains(_deviceId) &&
            element.pushTitle.contains(_pushTitle) &&
            element.sentState.contains(_state)) {
          contentsList.add(element);
        }
      });
    } else {
      list.forEach((element) {
        if (element.userId.contains(_userId) &&
            element.userName.contains(_userName) &&
            element.deviceId.contains(_deviceId) &&
            element.pushTitle.contains(_pushTitle) &&
            element.sentState.contains(_state)) {
          contentsList.add(element);
        }
      });
    }

    isSearchActive = true;
    if (_userId == "" &&
        _userName == "" &&
        _deviceId == "" &&
        _pushTitle == "" &&
        _state == "") {
      isSearchActive = false;
    }

    setState2.call(() {});
    Get.back();
  }

  void onTapSearchDialogNegative() {
    Get.back();
  }

  void onTapSearchFilterAll(void Function(void Function() fn) setState2) {
    setState2(() => readStatesIndex = 0);
  }

  void onTapSearchFilterStateTrue(void Function(void Function() fn) setState2) {
    setState2(() => readStatesIndex = 1);
  }

  void onTapSearchFilterStateFalse(
      void Function(void Function() fn) setState2) {
    setState2(() => readStatesIndex = 2);
  }

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
