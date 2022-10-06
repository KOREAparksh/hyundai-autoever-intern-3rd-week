import 'package:app/controller/base_controller.dart';
import 'package:app/dto/push_history/push_history_dto.dart';
import 'package:app/service/api/push_history/push_history_api.dart';
import 'package:app/service/custom_dio.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class PushHistoryController extends BaseController {
  RxBool isLoading = true.obs;
  final List<PushHistoryDto> list = <PushHistoryDto>[];
  final List<PushHistoryDto> contentsList = <PushHistoryDto>[].obs;
  final userIdController = TextEditingController();
  final userNameController = TextEditingController();
  final deviceIdController = TextEditingController();
  final pushTitleController = TextEditingController();
  final readStates = ["전체", "확인", "미확인"];
  RxInt readStatesIndex = 0.obs;
  RxBool isDescActive = false.obs;
  RxBool isSearchActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onClose() {
    super.onClose();
    userIdController.dispose();
    userNameController.dispose();
    deviceIdController.dispose();
    pushTitleController.dispose();
  }

  void initData() async {
    await getPushHistoryData();
    contentsList.clear();
    contentsList.addAll(list);
    isLoading(false);
  }

  Future<void> getPushHistoryData() async {
    CustomDio customDio = CustomDio();
    PushHistoryApi pushHistoryApi = PushHistoryApi(customDio.dio);
    try {
      final result = await pushHistoryApi.getPushHistory();
      list.clear();
      list.addAll(result.data);
      await Future.delayed(Duration(milliseconds: 500));
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

  dynamic _showDialog() {
    return showDialog(
      context: Get.context!,
      builder: (context) {
        return CustomDialog(
          mainTitle: "이력정보를 받아오지 못했습니다",
          subTitle: "메인화면으로 이동합니다",
          dialogType: DialogType.OK,
          onTapPositive: () => Get.back(),
        );
      },
    );
  }

  void onTapOrder() {
    isLoading(true);
    final temp = List.from(contentsList.reversed);
    contentsList.clear();
    temp.forEach((element) => contentsList.add(element));
    (isDescActive.isTrue) ? isDescActive(false) : isDescActive(true);
    isLoading(false);
  }

  void onTapInit() async {
    isLoading(true);
    Get.back();
    contentsList.clear();
    userIdController.clear();
    userNameController.clear();
    deviceIdController.clear();
    pushTitleController.clear();
    readStatesIndex(0);
    await getPushHistoryData();
    isSearchActive(false);
    (isDescActive.isTrue)
        ? list.reversed.forEach((element) => contentsList.add(element))
        : list.forEach((element) => contentsList.add(element));
    isLoading(false);
  }

  void onTapSearchDialogPositive() {
    isLoading(true);
    Get.back();

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
    if (isDescActive.isTrue) {
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
    isLoading(false);
  }

  void onTapSearchDialogNegative() {
    Get.back();
  }

  void onTapSearchFilterAll() => readStatesIndex(0);

  void onTapSearchFilterStateTrue() => readStatesIndex(1);

  void onTapSearchFilterStateFalse() => readStatesIndex(2);
}
