import 'package:app/const/Color.dart';
import 'package:app/controller/device_register_controller.dart';
import 'package:app/dto/device_dto.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:app/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Todo: Stateless로 변경 -> GetView
class DeviceRegisterScreen extends StatefulWidget {
  DeviceRegisterScreen({Key? key}) : super(key: key);

  @override
  State<DeviceRegisterScreen> createState() => _DeviceRegisterScreenState();
}

class _DeviceRegisterScreenState extends State<DeviceRegisterScreen> {
  final _title = "모바일기기등록";

  final _bodySideMargin = 27.0;
  final _headerHeight = 40.0;
  final _searchDialogContentsMargin = 30.0;
  final _searchDialogTextFieldPadding = 5.0;

  final controller =
      Get.put<DeviceRegisterController>(DeviceRegisterController());

  @override
  void initState() {
    super.initState();
    controller.list.forEach((element) => controller.contentList.add(element));
  }

  @override
  void dispose() {
    super.dispose();
    controller.userIdController.dispose();
    controller.deviceIdController.dispose();
    controller.deviceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: CustomAppBar(
        title: _title,
        hasStar: true,
        baseController: controller,
      ),
      drawer: CustomDrawer(),
      body: Container(
        margin: EdgeInsets.only(left: _bodySideMargin, right: _bodySideMargin),
        child: Column(
          children: [
            _header(),
            Expanded(child: _listView()),
          ],
        ),
      ),
    );
  }

  void _showDialog(Widget dialog) {
    showDialog(
      context: Get.context!,
      builder: (_) => dialog,
    );
  }

  _ListFilterHeader _header() {
    return _ListFilterHeader(
      height: _headerHeight,
      isSearchActive: controller.isSearchActive,
      onTapAdd: controller.onTapAddButton,
      onTapSearch: () => _showDialog(
        CustomDialog(
          mainTitle: "검색",
          contents: Container(
            margin: EdgeInsets.all(_searchDialogContentsMargin),
            child: Column(
              children: [
                _textField(
                  hint: "사용자ID",
                  controller: controller.userIdController,
                ),
                _textField(
                  hint: "Device명",
                  controller: controller.deviceIdController,
                ),
                _textField(
                  hint: "Device Kind",
                  controller: controller.deviceController,
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () => controller.onTapSearchInit(setState),
                  child: Text("초기화"),
                ),
              ],
            ),
          ),
          onTapPositive: () => controller.onTapSearchDialogPositive(setState),
          onTabNegative: controller.onTapSearchDialogNegative,
        ),
      ),
    );
  }

  Widget _textField({required String hint, required controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(_searchDialogTextFieldPadding),
        hintText: hint,
      ),
    );
  }

  Widget _listView() {
    if (controller.contentList.isEmpty) {
      return Center(
        child: Text(
          "등록된 모바일 기기가 없습니다.",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.contentList.length,
      cacheExtent: controller.contentList.length + 5,
      itemBuilder: (_, int i) => DeviceRegisterListTile(
        data: controller.contentList[i],
        onDelete: () => controller.onTapDelete(setState, i),
      ),
    );
  }
}

class _ListFilterHeader extends StatelessWidget {
  const _ListFilterHeader({
    Key? key,
    required this.height,
    required this.onTapAdd,
    required this.onTapSearch,
    required this.isSearchActive,
  }) : super(key: key);

  final double height;
  final VoidCallback onTapAdd;
  final VoidCallback onTapSearch;
  final bool isSearchActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconButtonForm(
            onPressed: onTapAdd,
            icon: Icon(Icons.add_box_rounded),
          ),
          _iconButtonForm(
            onPressed: onTapSearch,
            isActive: isSearchActive,
            icon: Icon(Icons.search_outlined),
          ),
        ],
      ),
    );
  }

  Widget _iconButtonForm(
      {required VoidCallback onPressed, required Icon icon, isActive = false}) {
    return Container(
      color: (isActive) ? mainColor : null,
      child: IconButton(
        onPressed: onPressed,
        color: (isActive) ? Colors.white : null,
        disabledColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        icon: icon,
      ),
    );
  }
}

class DeviceRegisterListTile extends StatelessWidget {
  const DeviceRegisterListTile({
    Key? key,
    required this.data,
    required this.onDelete,
  }) : super(key: key);

  final DeviceDto data;
  final VoidCallback onDelete;

  final _width = 330.0;
  final _height = 118.0;
  final _radius = 20.0;
  final _formHeight = 25.0;
  final _topBottomMargin = 5.0;
  final _innerPadding = 20.0;
  final _dividerMargin = 20.0;
  final _iconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      margin: EdgeInsets.only(top: _topBottomMargin, bottom: _topBottomMargin),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
        elevation: 5,
        color: Colors.white,
        shadowColor: shadowColor,
        child: Stack(
          children: [
            _contents(),
            _deleteIcon(),
          ],
        ),
      ),
    );
  }

  Widget _contents() {
    return Container(
      height: _height,
      padding: EdgeInsets.all(_innerPadding),
      child: Row(
        children: [
          Expanded(flex: 2, child: _info()),
          _divider(),
          Expanded(flex: 1, child: _state()),
        ],
      ),
    );
  }

  Widget _textForm(String str, {Color? color}) {
    return Text(
      str,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  Widget _info() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _form(child: _textForm(data.userId)),
        _form(child: _textForm(data.deviceId)),
        _form(child: _textForm(data.deviceDescription)),
      ],
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      color: Colors.black,
      margin: EdgeInsets.only(left: _dividerMargin, right: _dividerMargin),
    );
  }

  Widget _state() {
    return Column(
      children: [
        _form(
          child: _textForm(
            (data.isUsed == "Y") ? "사용 중" : "사용 안함",
            color: (data.isUsed == "Y") ? Colors.green : Colors.red,
          ),
        ),
        _form(child: _textForm("최대 전송 " + data.maxSentCount.toString())),
        _form(child: _textForm(data.deviceKind)),
      ],
    );
  }

  Widget _deleteIcon() {
    return Container(
      alignment: Alignment.topRight,
      child: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        disabledColor: Colors.transparent,
        onPressed: () {
          showDialog(
            context: Get.context!,
            builder: (_) {
              return CustomDialog(
                mainTitle: "정말  삭제하시겠습니까?",
                contents: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.userId),
                    Text(data.deviceId),
                    Text(data.deviceDescription),
                    Text(data.deviceKind),
                  ],
                ),
                onTapPositive: () {
                  onDelete.call();
                  Get.back();
                },
                onTabNegative: () => Get.back(),
              );
            },
          );
        },
        icon: Icon(Icons.delete, size: _iconSize),
      ),
    );
  }

  Widget _form({required Widget child}) {
    return Container(
      height: _formHeight,
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}
