import 'package:app/controller/widget/DeviceInfoFieldController.dart';
import 'package:app/dto/device_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceInfoField extends StatelessWidget {
  DeviceInfoField({
    Key? key,
    required this.onTapButton,
    required this.buttonText,
    this.deviceDto = const DeviceDto("", "", "", "", 0, ""),
  }) : super(key: key);

  final String buttonText;
  final DeviceDto deviceDto;
  final void Function(DeviceDto newDto) onTapButton;

  final _marginTop = 50.0;
  final _marginSide = 15.0;
  final _buttonWidth = 100.0;
  final controller = Get.put(DeviceInfoFieldController());

  @override
  Widget build(BuildContext context) {
    controller.initText(deviceDto);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(
            left: _marginSide, right: _marginSide, top: _marginTop),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _textFieldRow(
                title: "사용자ID",
                controller: controller.userIdController,
              ),
              _textFieldRow(
                title: "기기 ID",
                controller: controller.deviceIdController,
              ),
              _textFieldRow(
                title: "기기 설명",
                controller: controller.deviceDescController,
              ),
              _textFieldRow(
                title: "모바일 종류",
                controller: controller.deviceKindController,
              ),
              _textFieldRow(
                title: "최대전송",
                controller: controller.maxCountController,
                isNumber: true,
              ),
              _radioRow(),
              SizedBox(height: 10),
              SizedBox(
                width: _buttonWidth,
                child: ElevatedButton(
                  onPressed: () => controller.onTapButton(onTapButton),
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
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
    return TextFormField(
      controller: controller,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return "값이 비었습니다";
        }
        return null;
      },
      keyboardType: (isNumber) ? TextInputType.number : null,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(5),
      ),
    );
  }

  Widget _radioRow() {
    return Obx(
      () => Row(
        children: [
          _radio(title: "사용", value: true),
          _radio(title: "사용안함", value: false),
        ],
      ),
    );
  }

  Widget _radio({required String title, required bool value}) {
    return Expanded(
      flex: 1,
      child: RadioListTile<bool>(
        title: Text(title),
        value: value,
        groupValue: controller.state.value,
        onChanged: controller.onChangeRadioButton,
      ),
    );
  }
}
