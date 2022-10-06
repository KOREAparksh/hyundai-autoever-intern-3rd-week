import 'package:app/const/Color.dart';
import 'package:app/controller/screen/push_history_controller.dart';
import 'package:app/dto/push_history/push_history_dto.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:app/widget/custom_dialog.dart';
import 'package:app/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class PushHistoryScreen extends StatelessWidget {
  PushHistoryScreen({Key? key}) : super(key: key);
  final _title = "푸시알림전송이력";

  final _bodySideMargin = 27.0;
  final _headerHeight = 40.0;

  final controller = Get.put<PushHistoryController>(PushHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: CustomAppBar(
        title: _title,
        hasStar: true,
        baseController: controller,
      ),
      resizeToAvoidBottomInset: false,
      drawer: CustomDrawer(),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: _bodySideMargin,
              right: _bodySideMargin,
            ),
            child: _ListView(headerHeight: _headerHeight),
          ),
          Container(
            alignment: Alignment.topRight,
            child: Obx(
              () => ListFilterHeader(
                height: _headerHeight,
                margin: _bodySideMargin,
                isSearchActive: controller.isSearchActive.value,
                isOrderActive: controller.isDescActive.value,
                onTapOrder: controller.onTapOrder,
                onTapSearch: _searchDialog,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _searchDialog() {
    showDialog(
      context: Get.context!,
      builder: (_) => _SearchDialog(),
    );
  }
}

class _SearchDialog extends GetView<PushHistoryController> {
  const _SearchDialog({Key? key}) : super(key: key);

  final _searchDialogTextFieldPadding = 5.0;
  final _searchDialogContentsMargin = 30.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: CustomDialog(
          mainTitle: "검색",
          positiveButtonText: "검색",
          negativeButtonText: "취소",
          contents: Container(
            margin: EdgeInsets.all(_searchDialogContentsMargin),
            child: Column(
              children: [
                _textField(
                  hint: "사용자ID",
                  controller: controller.userIdController,
                ),
                _textField(
                  hint: "사용자이름",
                  controller: controller.userNameController,
                ),
                _textField(
                  hint: "DeviceID",
                  controller: controller.deviceIdController,
                ),
                _textField(
                  hint: "푸시제목",
                  controller: controller.pushTitleController,
                ),
                RadioButtons(),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: controller.onTapInit,
                  child: Text("초기화"),
                ),
              ],
            ),
          ),
          onTapPositive: controller.onTapSearchDialogPositive,
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
}

class RadioButtons extends GetView<PushHistoryController> {
  const RadioButtons({Key? key}) : super(key: key);

  final _radioButtonsHeight = 100.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _radioButtonsHeight,
      child: Obx(
        () => Column(
          children: [
            _radioTile(0, "전체"),
            _radioTile(1, "수신"),
            _radioTile(2, "미수신"),
          ],
        ),
      ),
    );
  }

  Widget _radioTile(int i, String title) {
    return Expanded(
      flex: 1,
      child: RadioListTile<String>(
        title: Text(title),
        value: controller.readStates[i],
        groupValue: controller.readStates[controller.readStatesIndex.value],
        onChanged: (_) {
          if (i == 0) {
            controller.onTapSearchFilterAll();
          } else if (i == 1) {
            controller.onTapSearchFilterStateTrue();
          } else if (i == 2) {
            controller.onTapSearchFilterStateFalse();
          }
        },
      ),
    );
  }
}

class _ListView extends GetView<PushHistoryController> {
  const _ListView({Key? key, required this.headerHeight}) : super(key: key);

  final _dateFormat = "yyyy-MM-dd";
  final headerHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (controller.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator());
        }
        return (controller.contentsList.isEmpty)
            ? _nothing()
            : GroupedListView<PushHistoryDto, DateTime>(
                elements: controller.contentsList,
                groupBy: (element) => DateTime.parse(
                    DateFormat("yyyyMMdd").format(element.sentDateTime)),
                // sort: false,
                order: (controller.isDescActive.value)
                    ? GroupedListOrder.DESC
                    : GroupedListOrder.ASC,
                cacheExtent: controller.contentsList.length + 5,
                itemBuilder: (_, element) => PushHistoryListTile(data: element),
                groupHeaderBuilder: (element) => _groupHeader(element),
                useStickyGroupSeparators: true,
              );
      }),
    );
  }

  Widget _nothing() {
    return Center(
      child: Text(
        "푸시알림이력이 없습니다.",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _groupHeader(PushHistoryDto element) {
    return Container(
      height: headerHeight,
      color: Colors.transparent,
      alignment: Alignment.centerLeft,
      child: Text(
        DateFormat(_dateFormat).format(element.sentDateTime),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
      ),
    );
  }
}

class ListFilterHeader extends StatelessWidget {
  const ListFilterHeader({
    Key? key,
    required this.height,
    required this.margin,
    required this.onTapSearch,
    required this.onTapOrder,
    required this.isSearchActive,
    required this.isOrderActive,
  }) : super(key: key);

  final double height;
  final double margin;
  final VoidCallback onTapSearch;
  final VoidCallback onTapOrder;
  final bool isSearchActive;
  final bool isOrderActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height,
      margin: EdgeInsets.only(left: margin, right: margin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          _iconButtonForm(
            onPressed: onTapOrder,
            isActive: isOrderActive,
            icon: Icon(Icons.sort_by_alpha),
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
        icon: icon,
        color: (isActive) ? Colors.white : null,
        disabledColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
      ),
    );
  }
}

class PushHistoryListTile extends StatelessWidget {
  const PushHistoryListTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final PushHistoryDto data;

  final _width = 330.0;
  final _topBottomMargin = 10.0;
  final _radius = 20.0;
  final _infoMainWidth = 100.0;
  final _formHeight = 25.0;
  final _titleFormHeight = 30.0;
  final _stateWidth = 20.0;
  final _stateHeight = 15.0;
  final _dateFormat = "yy/MM/dd HH:mm:ss";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: _topBottomMargin, bottom: _topBottomMargin),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
        elevation: 5,
        color: Colors.white,
        shadowColor: Color(0x2b333333),
        child: Container(
          width: _width,
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(
            children: [
              _form(child: _timeContainer()),
              Container(height: 1, color: Colors.black),
              _form(child: _infoForm(name: data.userName, id: data.userId)),
              _form(
                child:
                    _infoForm(name: data.deviceDescription, id: data.deviceId),
              ),
              Container(height: 1, color: Colors.black),
              SizedBox(height: 5),
              _pushTitle(),
              _form(child: _pushContents()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pushContents() =>
      Text(data.pushContent, overflow: TextOverflow.ellipsis);

  Widget _pushTitle() {
    return Container(
      height: _titleFormHeight,
      alignment: Alignment.centerLeft,
      child: Text(
        data.pushTitle,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _timeContainer() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _timeForm(
              title: "푸시",
              time: DateFormat(_dateFormat).format(data.pushDateTime)),
        ),
        Expanded(
          flex: 1,
          child: _timeForm(
              title: "수신",
              time: DateFormat(_dateFormat).format(data.sentDateTime)),
        ),
        Container(
          width: _stateWidth,
          height: _stateHeight,
          color: data.sentState == "Y" ? Colors.green : Colors.red,
          alignment: Alignment.center,
          child: Text(
            data.sentState,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ],
    );
  }

  Widget _form({required Widget child}) {
    return Container(
      height: _formHeight,
      alignment: Alignment.centerLeft,
      child: child,
    );
  }

  Widget _timeForm({required String title, required String time}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          time,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: textLight),
        ),
      ],
    );
  }

  Widget _infoForm({required String name, required String id}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: _infoMainWidth,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          id,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: textLight),
        ),
      ],
    );
  }
}
