import 'package:app/const/Color.dart';
import 'package:app/const/route.dart';
import 'package:app/controller/screen/main_controller.dart';
import 'package:app/screen/device_register_screen.dart';
import 'package:app/screen/push_history_screen.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:app/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: CustomAppBar(baseController: controller),
      resizeToAvoidBottomInset: false,
      drawer: (Get.context!.isPhone)
          ? CustomDrawer(baseController: controller)
          : null,
      body: _body(),
    );
  }

  Widget _body() {
    return GetBuilder<MainController>(builder: (_) {
      return (controller.user == null) ? _loading() : _contents();
    });
  }

  Widget _loading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _contents() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _DashBoard(),
          _ButtonComplex(),
        ],
      ),
    );
  }
}

class _DashBoard extends StatelessWidget {
  const _DashBoard({Key? key}) : super(key: key);

  final _widthMobile = 280.0;
  final _heightMobile = 136.0;
  final _widthTablet = double.infinity;
  final _heightTablet = 200.0;
  final _maxWidthLandScape = 800.0;
  final _marginTablet = 50.0;
  final _radius = 20.0;
  final _innerPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    final isPhone = Get.context!.isPhone;
    final _width = (isPhone) ? _widthMobile : _widthTablet;
    final _height = (isPhone) ? _heightMobile : _heightTablet;
    final _margin = (isPhone)
        ? null
        : EdgeInsets.only(left: _marginTablet, right: _marginTablet);

    return Container(
      width: _width,
      height: _height,
      margin: _margin,
      padding: EdgeInsets.all(_innerPadding),
      constraints: BoxConstraints(maxWidth: _maxWidthLandScape),
      decoration: BoxDecoration(
        border: Border.all(color: boxBorderDisable),
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          _contents(),
        ],
      ),
    );
  }

  Widget _title() => Text(
        "고객님께 드리는 공지",
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _contents() => Text(
        "이 공지는 영국에서부터 시작되어......",
        overflow: TextOverflow.ellipsis,
      );
}

class _ButtonComplex extends GetView<MainController> {
  const _ButtonComplex({Key? key}) : super(key: key);

  final int _itemCountMobile = 6;
  final int _crossAxisCountMobile = 2;
  final double _gridAxisSpacingMobile = 10;
  final _widthMobile = 280.0;
  final int _itemCountTablet = 8;
  final double _maxCrossAxisExtent = 240;
  final double _crossAxisSpacingTablet = 20;
  final double _mainAxisSpacing = 20;
  final _marginTablet = 50.0;

  @override
  Widget build(BuildContext context) {
    final _margin = (Get.context!.isPhone)
        ? null
        : EdgeInsets.only(left: _marginTablet, right: _marginTablet);

    return Container(
      margin: _margin,
      child: GetBuilder<MainController>(
        builder: (_) => (controller.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : (Get.context!.isPhone)
                ? _gridViewMobile()
                : _gridViewTablet(),
      ),
    );
  }

  Widget _gridViewMobile() {
    return SizedBox(
      width: _widthMobile,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: _itemCountMobile,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCountMobile,
          crossAxisSpacing: _gridAxisSpacingMobile,
          mainAxisSpacing: _gridAxisSpacingMobile,
        ),
        itemBuilder: (context, int i) =>
            GetBuilder<MainController>(builder: (_) {
          return _FavoriteButton(
            title: (controller.favoriteDtoList.length > i)
                ? controller.favoriteDtoList[i].screenName
                : null,
            onTap: (controller.favoriteDtoList.length > i)
                ? () => controller.onTapButton(i)
                : null,
          );
        }),
      ),
    );
  }

  Widget _gridViewTablet() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: _itemCountTablet,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: _maxCrossAxisExtent,
        crossAxisSpacing: _crossAxisSpacingTablet,
        mainAxisSpacing: _mainAxisSpacing,
      ),
      itemBuilder: (context, int i) => GetBuilder<MainController>(builder: (_) {
        return _FavoriteButton(
          title: (controller.favoriteDtoList.length > i)
              ? controller.favoriteDtoList[i].screenName
              : null,
          onTap: (controller.favoriteDtoList.length > i)
              ? () => controller.onTapButton(i)
              : null,
        );
      }),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    Key? key,
    this.title,
    this.onTap,
  }) : super(key: key);

  final _width = 136.0;
  final _height = 136.0;
  final _radius = 20.0;
  final _padding = 10.0;

  final String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _width,
        height: _height,
        padding: EdgeInsets.all(_padding),
        decoration: BoxDecoration(
          border: Border.all(
            color: (title == null) ? boxBorderDisable : mainColor,
          ),
          borderRadius: BorderRadius.circular(_radius),
        ),
        child: Center(
          child: Text(
            title ?? "Blank",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: (title != null) ? null : textDisable,
              fontWeight: (title != null) ? FontWeight.bold : null,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
