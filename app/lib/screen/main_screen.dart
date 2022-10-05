import 'package:app/const/Color.dart';
import 'package:app/controller/screen/main_controller.dart';
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
      drawer: CustomDrawer(baseController: controller),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            _DashBoard(),
            _ButtonComplex(),
          ],
        ),
      ),
    );
  }
}

class _DashBoard extends StatelessWidget {
  const _DashBoard({Key? key}) : super(key: key);

  final _width = 280.0;
  final _height = 136.0;
  final _radius = 20.0;
  final _innerPadding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      padding: EdgeInsets.all(_innerPadding),
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
        "이 편지는 영국에서부터 시작되어......",
        overflow: TextOverflow.ellipsis,
      );
}

class _ButtonComplex extends GetView<MainController> {
  const _ButtonComplex({Key? key}) : super(key: key);

  final int _itemCount = 6;
  final double _gridViewWidth = 280;
  final int _crossAxisCount = 2;
  final double _gridAxisSpacing = 10;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _gridViewWidth,
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: _itemCount,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _crossAxisCount,
          crossAxisSpacing: _gridAxisSpacing,
          mainAxisSpacing: _gridAxisSpacing,
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
