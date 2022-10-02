import 'package:app/controller/base_controller.dart';
import 'package:app/dto/device_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceModifyController extends BaseController {
  void onTapAddButton(DeviceDto deviceDto, DeviceDto newDto) {
    print(deviceDto == newDto);
    print(deviceDto);
    print(newDto);
  }
}
