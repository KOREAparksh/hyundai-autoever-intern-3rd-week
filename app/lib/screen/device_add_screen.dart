import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceAddScreen extends StatelessWidget {
  const DeviceAddScreen({
    Key? key,
  }) : super(key: key);

  final _title = "모바일기기 등록하기";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(title: _title, hasBack: true, hasNoti: false),
        body: DeviceInfoField(
          onTapButton: (s1, s2, s3, s4, s5) => print("$s1 \n "),
          buttonText: "추가",
        ),
      ),
    );
  }
}

class DeviceInfoField extends StatefulWidget {
  const DeviceInfoField({
    Key? key,
    required this.onTapButton,
    required this.buttonText,
  }) : super(key: key);

  final String buttonText;
  final void Function(
    String s1,
    String s2,
    String s3,
    String s4,
    String s5,
  ) onTapButton;

  @override
  State<DeviceInfoField> createState() => _DeviceInfoFieldState();
}

class _DeviceInfoFieldState extends State<DeviceInfoField> {
  final _marginTop = 50.0;
  final _marginSide = 15.0;
  final _buttonWidth = 100.0;

  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _deviceIdController = TextEditingController();
  final _deviceDescController = TextEditingController();
  final _deviceKindController = TextEditingController();
  final _stateController = TextEditingController();
  bool? _state = true;

  @override
  void dispose() {
    super.dispose();
    _userIdController.dispose();
    _deviceIdController.dispose();
    _deviceDescController.dispose();
    _deviceKindController.dispose();
    _stateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: _marginSide, right: _marginSide, top: _marginTop),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _textFieldRow(title: "사용자ID", controller: _userIdController),
            _textFieldRow(title: "기기 ID", controller: _deviceIdController),
            _textFieldRow(title: "기기 설명", controller: _deviceDescController),
            _textFieldRow(title: "모바일 종류", controller: _deviceKindController),
            _textFieldRow(title: "사용자ID", controller: _stateController),
            _radioRow(),
            SizedBox(height: 10),
            SizedBox(
              width: _buttonWidth,
              child: ElevatedButton(
                onPressed: () => widget.onTapButton(
                  _userIdController.text,
                  _deviceIdController.text,
                  _deviceDescController.text,
                  _deviceKindController.text,
                  _stateController.text,
                ),
                child: Text(widget.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldRow({required title, required controller}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(title, style: TextStyle(fontSize: 16)),
          ),
          Expanded(
            flex: 5,
            child: _textField(controller: controller),
          ),
        ],
      ),
    );
  }

  Widget _textField({required controller}) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(5),
        ),
      ),
    );
  }

  Widget _radioRow() {
    return Row(
      children: [
        _radio(title: "사용", value: true),
        _radio(title: "사용안함", value: false),
      ],
    );
  }

  Widget _radio({required String title, required bool value}) {
    return Expanded(
      flex: 1,
      child: RadioListTile<bool>(
        title: Text(title),
        value: value,
        groupValue: _state,
        onChanged: (v) => setState(() {
          _state = v;
        }),
      ),
    );
  }
}
