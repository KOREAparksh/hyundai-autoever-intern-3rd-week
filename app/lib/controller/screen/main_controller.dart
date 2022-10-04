import 'package:app/controller/base_controller.dart';
import 'package:app/dto/favorite_dto/favorite_dto.dart';
import 'package:app/models/user/user.dart';
import 'package:app/screen/login_dummy_screen.dart';
import 'package:app/service/api/favorite/favorite_api.dart';
import 'package:app/service/api/user/user_api.dart';
import 'package:app/service/custom_dio.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class MainController extends BaseController {
  User? user;
  List<FavoriteDto> favoriteDtoList = <FavoriteDto>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
    await getFavoriteData();
    print(favoriteDtoList);
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
        _showDialogByUser();
      }
    }
  }

  Future<void> getFavoriteData() async {
    CustomDio customDio = CustomDio();
    FavoriteApi favoriteApi = FavoriteApi(customDio.dio);
    try {
      final result = await favoriteApi.getFavoriteScreen(user!.id);
      favoriteDtoList.addAll(result.data);
    } on DioError catch (e) {
      print("DioError: " +
          (e.response?.statusCode.toString() ?? "") +
          " : " +
          e.message);
    } catch (e) {
      print("Error: " + e.toString());
      _showDialogByFavorite();
    } finally {
      customDio.dio.close();
    }
  }

  dynamic _showDialogByUser() {
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

  dynamic _showDialogByFavorite() {
    return showDialog(
      context: Get.context!,
      builder: (context) {
        return CustomDialog(
          mainTitle: "즐겨찾기정보를 받아오지 못했습니다",
          dialogType: DialogType.OK,
          onTapPositive: () => Get.back(),
        );
      },
    );
  }

  void onTapButton(int i) {
    Get.toNamed(favoriteDtoList[i].screenUrl);
  }
}
