// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceDto _$DeviceDtoFromJson(Map<String, dynamic> json) => DeviceDto(
      json['user_id'] as String,
      json['device_id'] as String,
      json['device_description'] as String,
      json['device_kind'] as String,
      json['max_sent_count'] as int,
      json['is_used'] as String,
    );

Map<String, dynamic> _$DeviceDtoToJson(DeviceDto instance) => <String, dynamic>{
      'user_id': instance.userId,
      'device_id': instance.deviceId,
      'device_description': instance.deviceDescription,
      'device_kind': instance.deviceKind,
      'max_sent_count': instance.maxSentCount,
      'is_used': instance.isUsed,
    };
