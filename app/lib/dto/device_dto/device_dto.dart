import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_dto.g.dart';

@JsonSerializable()
class DeviceDto {
  @JsonKey(name: "user_id")
  final String userId;

  @JsonKey(name: "device_id")
  final String deviceId;

  @JsonKey(name: "device_description")
  final String deviceDescription;

  @JsonKey(name: "device_kind")
  final String deviceKind;

  @JsonKey(name: "max_sent_count")
  final int maxSentCount;

  @JsonKey(name: "is_used")
  final String isUsed;

  const DeviceDto(this.userId, this.deviceId, this.deviceDescription,
      this.deviceKind, this.maxSentCount, this.isUsed);

  factory DeviceDto.fromJson(Map<String, dynamic> json) =>
      _$DeviceDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceDtoToJson(this);

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
