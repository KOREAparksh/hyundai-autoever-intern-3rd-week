import 'package:app/controller/base_controller.dart';
import 'package:app/models/user/user.dart';
import 'package:app/screen/login_dummy_screen.dart';
import 'package:app/service/api/user/user_api.dart';
import 'package:app/service/custom_dio.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class MainController extends BaseController {
  late final User? user;

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
  }

  Future<void> getUserData() async {
    CustomDio customDio = CustomDio(autoDialog: false);
    UserApi userApi = UserApi(customDio.dio);
    try {
      final result = await userApi.getUserData("seunpark");
      // final result = await userApi.getUserData("dummy");
      user = result.data;
    } on DioError catch (e) {
      print(e.response?.statusCode.toString() ?? "" " : " + e.message);
      user = null;
    } catch (e) {
      print(e);
      user = null;
    } finally {
      customDio.dio.close();
      if (user == null) {
        _showDialog();
      }
    }
  }

  dynamic _showDialog() {
    return showDialog(
      context: Get.context!,
      builder: (context) {
        return CustomDialog(
          mainTitle: "유저정보를 받아오지 못했습니다",
          subTitle: "로그인화면으로 이동합니다",
          dialogType: DialogType.OK,
          onTapPositive: () => Get.offAll(() => LoginDummyScreen()),
        );
      },
    );
  }
}
