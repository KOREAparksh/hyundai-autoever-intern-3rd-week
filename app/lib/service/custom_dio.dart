import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

enum CustomDioError { notInternetConnected }

class CustomDto {
  final Dio dio = Dio();

  CustomDto() {
    dio.interceptors.clear();
    dio.interceptors.add(CustomInterceptor());
  }
}

class CustomInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    await showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return CustomDialog(
          dialogType: DialogType.OK,
          mainTitle: "${err.response?.statusCode}에러",
          subTitle: err.message,
          positiveButtonText: "닫기",
          onTapPositive: () => Get.back(),
        );
      },
    );
    return handler.next(err);
  }
}
