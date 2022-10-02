import 'package:flutter/material.dart';

class DeviceDto {
  final String userId;
  final String deviceId;
  final String deviceDescription;
  final String deviceKind;
  final int maxSentCount;
  final String isUsed;

  const DeviceDto(this.userId, this.deviceId, this.deviceDescription,
      this.deviceKind, this.maxSentCount, this.isUsed);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceDto &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          deviceDescription == other.deviceDescription &&
          deviceId == other.deviceId &&
          deviceKind == other.deviceKind &&
          maxSentCount == other.maxSentCount &&
          isUsed == other.isUsed;

  @override
  String toString() {
    return 'DeviceDto{userId: $userId, deviceDescription: $deviceDescription, deviceId: $deviceId, deviceKind: $deviceKind, maxSentCount: $maxSentCount, isUsed: $isUsed}';
  }
}
