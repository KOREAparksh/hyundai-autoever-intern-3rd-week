import 'package:flutter/material.dart';

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
    int s5,
    bool isUse,
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
  final _maxCountController = TextEditingController();
  bool _state = true;

  @override
  void dispose() {
    super.dispose();
    _userIdController.dispose();
    _deviceIdController.dispose();
    _deviceDescController.dispose();
    _deviceKindController.dispose();
    _maxCountController.dispose();
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
            _textFieldRow(
              title: "최대전송",
              controller: _maxCountController,
              isNumber: true,
            ),
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
                  int.parse(_maxCountController.text),
                  _state,
                ),
                child: Text(widget.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldRow(
      {required title, required controller, isNumber = false}) {
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
            child: _textField(controller: controller, isNumber: isNumber),
          ),
        ],
      ),
    );
  }

  Widget _textField({required controller, isNumber = false}) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        keyboardType: (isNumber) ? TextInputType.number : null,
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
          _state = v!;
        }),
      ),
    );
  }
}
