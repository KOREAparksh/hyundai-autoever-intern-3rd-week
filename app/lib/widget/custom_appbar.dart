import 'package:app/controller/base_controller.dart';
import 'package:app/controller/screen/main_controller.dart';
import 'package:app/dto/favorite_dto/favorite_dto.dart';
import 'package:app/screen/noti_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.middleAsset,
    this.hasBack = false,
    this.hasNoti = true,
    this.hasStar = false,
    this.baseController,
  }) : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(72.0);

  final String? title;
  final String? middleAsset;
  final bool hasBack;
  final bool hasNoti;
  final bool hasStar;

  final BaseController? baseController;

  //Size
  final _logoWidth = 100.0;

  //MarginPadding
  final _appBarLeadingMargin = 13.0;
  final _appBarTitleSideMargin = 80.0;
  final _appBarTrailingMargin = 13.0;
  final _appBarTrailingInnerMargin = 7.0;
  final _appBarLogoBottomMargin = 5.0;

  //Asset
  final _logo = "assets/autoever_logo.png";

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: _middleWidget(),
      automaticallyImplyLeading: false,
    );
  }

  Widget _middleWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _actions(),
        _center(),
      ],
    );
  }

  Widget _actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _leading(),
        _trailing(),
      ],
    );
  }

  Widget _leading() {
    return Container(
      margin: EdgeInsets.only(left: _appBarLeadingMargin),
      child: (hasBack)
          ? _customIconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios),
            )
          : (Get.context!.isPhone)
              ? _customIconButton(
                  icon: Icon(Icons.menu),
                  onPressed: baseController?.openDrawer ??
                      () => Get.snackbar("Error", "base controller error"),
                )
              : Container(),
    );
  }

  Widget _center() {
    return (title == null)
        ? Container(
            margin: EdgeInsets.only(bottom: _appBarLogoBottomMargin),
            child: Image.asset(_logo, width: _logoWidth))
        : Container(
            margin: EdgeInsets.only(
                left: _appBarTitleSideMargin, right: _appBarTitleSideMargin),
            child: Text(title!, overflow: TextOverflow.ellipsis),
          );
  }

  Widget _trailing() {
    return Container(
      margin: EdgeInsets.only(right: _appBarTrailingMargin),
      child: Obx(
        () => Row(
          children: _trailingList(),
        ),
      ),
    );
  }

  List<Widget> _trailingList() {
    final controller = Get.find<MainController>();

    FavoriteDto? dto = controller.favoriteDtoList.firstWhere(
      (element) => ((element.screenUrl == Get.currentRoute) ||
          (element.screenUrl == BaseController.route.value)),
      orElse: () => FavoriteDto("", "", ""),
    );
    if (dto.screenId == "") dto = null;

    List<Widget> _list = [];
    if (hasStar) {
      _list.add(_customIconButton(
        icon: Icon(
          (dto == null) ? Icons.star_border : Icons.star,
          color: (dto == null) ? null : Colors.yellow,
        ),
        onPressed: () {
          if (dto == null) {
            if (Get.context!.isPhone) {
              controller.onTapStarAdd(Get.currentRoute);
            } else {
              controller.onTapStarAdd(BaseController.route.value);
            }
          } else
            controller.onTapStarRemove(dto.screenId);
        },
      ));
    }
    if (hasNoti) {
      _list.add(SizedBox(width: _appBarTrailingInnerMargin));
      _list.add(_customIconButton(
        icon: Icon(Icons.notifications),
        onPressed: () => Get.to(() => NotiScreen()),
      ));
    }
    return _list;
  }

  Widget _customIconButton({
    required VoidCallback onPressed,
    required Icon icon,
  }) {
    return Material(
      child: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        disabledColor: Colors.transparent,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
