import 'package:app/const/Color.dart';
import 'package:app/dto/device_dto.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class DeviceRegisterScreen extends StatelessWidget {
  const DeviceRegisterScreen({Key? key}) : super(key: key);

  final _title = "모바일기기등록";

  final List<DeviceDto> _list = const [
    DeviceDto("WJKIM", "note10", "device1", "Android", 3, "Y"),
    DeviceDto("WJKIM", "note11", "device2", "Android", 3, "N"),
    DeviceDto("WJKIM", "note12", "device3", "Android", 3, "Y"),
    DeviceDto("asdf", "note13", "device4", "Android", 3, "N"),
    DeviceDto("asdf", "note14", "device5", "Android", 3, "Y"),
    DeviceDto("asdfasdf", "note15", "device6", "Android", 3, "Y"),
    DeviceDto("asdfasdf", "note16", "device7", "Android", 3, "N"),
    DeviceDto("hyj", "note17", "device8", "Android", 3, "Y"),
    DeviceDto("hyj", "note18", "device9", "Android", 3, "Y"),
    DeviceDto("parkseunghan", "note19", "1device1", "Android", 3, "Y"),
    DeviceDto("parkseunghan", "note20", "1device11", "Android", 3, "Y"),
    DeviceDto("parkseunghan", "note21", "1device111", "Android", 3, "Y"),
  ];

  final _bodySideMargin = 27.0;
  final _headerHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _title,
        hasStar: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: _bodySideMargin, right: _bodySideMargin),
        child: Column(
          children: [
            _ListFilterHeader(
              height: _headerHeight,
              onTapAdd: () {},
              onTapSort: () {},
              onTapSearch: () {},
            ),
            Expanded(child: _listView()),
          ],
        ),
      ),
    );
  }

  Widget _listView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _list.length,
      cacheExtent: _list.length + 5,
      itemBuilder: (_, int i) => DeviceRegisterListTile(data: _list[i]),
    );
  }
}

class _ListFilterHeader extends StatelessWidget {
  const _ListFilterHeader({
    Key? key,
    required this.height,
    required this.onTapAdd,
    required this.onTapSort,
    required this.onTapSearch,
  }) : super(key: key);

  final double height;
  final VoidCallback onTapAdd;
  final VoidCallback onTapSort;
  final VoidCallback onTapSearch;

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
          Row(
            children: [
              _iconButtonForm(
                onPressed: onTapSort,
                icon: Icon(Icons.sort_by_alpha),
              ),
              _iconButtonForm(
                onPressed: onTapSearch,
                icon: Icon(Icons.search_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconButtonForm(
      {required VoidCallback onPressed, required Icon icon}) {
    return IconButton(
      onPressed: onPressed,
      disabledColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      icon: icon,
    );
  }
}

class DeviceRegisterListTile extends StatelessWidget {
  const DeviceRegisterListTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DeviceDto data;

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
        onPressed: () {},
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
