// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushHistoryDto _$PushHistoryDtoFromJson(Map<String, dynamic> json) =>
    PushHistoryDto(
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      deviceId: json['device_id'] as String,
      deviceDescription: json['device_description'] as String,
      pushTitle: json['push_title'] as String,
      pushContent: json['push_content'] as String,
      pushDateTime: DateTime.parse(json['push_date_time'] as String),
      sentState: json['sent_state'] as String,
      sentDateTime: DateTime.parse(json['sent_date_time'] as String),
    );

Map<String, dynamic> _$PushHistoryDtoToJson(PushHistoryDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'device_id': instance.deviceId,
      'device_description': instance.deviceDescription,
      'push_title': instance.pushTitle,
      'push_content': instance.pushContent,
      'push_date_time': instance.pushDateTime.toIso8601String(),
      'sent_state': instance.sentState,
      'sent_date_time': instance.sentDateTime.toIso8601String(),
    };
