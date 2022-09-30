import 'package:app/dto/device_dto.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class DeviceRegisterScreen extends StatelessWidget {
  const DeviceRegisterScreen({Key? key}) : super(key: key);

  final _title = "모바일기기등록";

  final List<DeviceDto> _list = const [
    DeviceDto("WJKIM", "note10", "device1", "Android", 3, "Y"),
    DeviceDto("WJKIM", "note11", "device2", "Android", 3, "Y"),
    DeviceDto("WJKIM", "note12", "device3", "Android", 3, "Y"),
    DeviceDto("asdf", "note13", "device4", "Android", 3, "Y"),
    DeviceDto("asdf", "note14", "device5", "Android", 3, "Y"),
    DeviceDto("asdfasdf", "note15", "device6", "Android", 3, "Y"),
    DeviceDto("asdfasdf", "note16", "device7", "Android", 3, "Y"),
    DeviceDto("hyj", "note17", "device8", "Android", 3, "Y"),
    DeviceDto("hyj", "note18", "device9", "Android", 3, "Y"),
    DeviceDto("parkseunghan", "note19", "1device1", "Android", 3, "Y"),
    DeviceDto("parkseunghan", "note20", "1device11", "Android", 3, "Y"),
    DeviceDto("parkseunghan", "note21", "1device111", "Android", 3, "Y"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _title,
        hasStar: true,
      ),
      body: DeviceRegisterListTile(
        data: _list[0],
      ),
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
  final _formHeight = 25.0;
  final _topBottomMargin = 10.0;
  final _innerPadding = 20.0;
  final _dividerMargin = 20.0;
  final _radius = 20.0;

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
        shadowColor: Color(0x2b333333),
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
          Expanded(
            flex: 2,
            child: _info(),
          ),
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
      // color: Colors.blue,
      alignment: Alignment.topRight,
      child: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        disabledColor: Colors.transparent,
        onPressed: () {},
        icon: Icon(
          Icons.delete,
          size: 20,
        ),
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
