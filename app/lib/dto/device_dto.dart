import 'package:flutter/material.dart';

class DeviceDto {
  final String userId;
  final String deviceDescription;
  final String deviceId;
  final String deviceKind;
  final int maxSentCount;
  final String isUsed;

  DeviceDto(this.userId, this.deviceDescription, this.deviceId, this.deviceKind,
      this.maxSentCount, this.isUsed);
}
