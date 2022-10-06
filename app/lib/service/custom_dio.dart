import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum CustomDioError { notInternetConnected }

class CustomDio {
  final Dio dio = Dio();
  final bool autoDialog;

  CustomDio({this.autoDialog = true}) {
    dio.options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      baseUrl: dotenv.get("BASE_URL"),
    );
    dio.interceptors.clear();
    dio.interceptors.add(CustomInterceptor(autoDialog: autoDialog));
  }
}

class CustomInterceptor extends InterceptorsWrapper {
  final bool autoDialog;

  CustomInterceptor({required this.autoDialog});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (autoDialog == false) {
      return handler.next(err);
    }
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
