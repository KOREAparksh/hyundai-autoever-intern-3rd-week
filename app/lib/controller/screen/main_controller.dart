import 'package:app/const/route.dart';
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
  List<FavoriteDto> favoriteDtoList = <FavoriteDto>[];
  final RxBool isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    initData();
  }

  void initData() async {
    await getUserData();
    await getFavoriteData();
    isLoading(false);
    update();
  }

  Future<void> getUserData() async {
    CustomDio customDio = CustomDio(autoDialog: false);
    UserApi userApi = UserApi(customDio.dio);
    try {
      final result = await userApi.getUserData("seunpark");
      // final result = await userApi.getUserData("dummy");
      await Future.delayed(Duration(milliseconds: 500));
      user = result.data;
      update();
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
      favoriteDtoList.clear();
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
    if (Get.context!.isPhone) {
      Get.toNamed(favoriteDtoList[i].screenUrl);
      return;
    }
    Get.offNamed(favoriteDtoList[i].screenUrl, id: TabletNavigator.key);
    changeRoute(favoriteDtoList[i].screenUrl);
  }

  void onTapStarAdd(String screenUrl) async {
    await postFavoriteData(screenUrl);
    update();
  }

  void onTapStarRemove(String screenId) async {
    await deleteFavoriteData(screenId);
    update();
  }

  Future<void> postFavoriteData(String screenUrl) async {
    CustomDio customDio = CustomDio(autoDialog: false);
    FavoriteApi favoriteApi = FavoriteApi(customDio.dio);
    try {
      await favoriteApi.postFavoriteScreen(user!.id, screenUrl);
      await getFavoriteData();
    } on DioError catch (e) {
      print("DioError: " +
          (e.response?.statusCode.toString() ?? "") +
          " : " +
          e.response?.data);
      _showDialogByFavoriteConnected("등록되지 않았습니다.");
    } catch (e) {
      print("Error: " + e.toString());
      _showDialogByFavoriteConnected("등록되지 않았습니다.");
    } finally {
      customDio.dio.close();
    }
  }

  Future<void> deleteFavoriteData(String screenId) async {
    CustomDio customDio = CustomDio(autoDialog: false);
    FavoriteApi favoriteApi = FavoriteApi(customDio.dio);
    try {
      await favoriteApi.deleteFavoriteScreen(user!.id, screenId);
      await getFavoriteData();
    } on DioError catch (e) {
      print("DioError: " +
          (e.response?.statusCode.toString() ?? "") +
          " : " +
          e.response?.data);
      _showDialogByFavoriteConnected("삭제되지 않았습니다.");
    } catch (e) {
      print("Error: " + e.toString());
      _showDialogByFavoriteConnected("삭제되지 않았습니다.");
    } finally {
      customDio.dio.close();
    }
  }

  dynamic _showDialogByFavoriteConnected(String title) {
    return showDialog(
      context: Get.context!,
      builder: (context) {
        return CustomDialog(
          mainTitle: title,
          subTitle: "잠시 후 다시 시도해주세요.",
          dialogType: DialogType.OK,
          onTapPositive: () => Get.back(),
        );
      },
    );
  }
}
