// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_group_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushGroupDto _$PushGroupDtoFromJson(Map<String, dynamic> json) => PushGroupDto(
      json['push_group_id'] as String,
      json['push_group_name'] as String,
      json['is_check'] as bool,
    );

Map<String, dynamic> _$PushGroupDtoToJson(PushGroupDto instance) =>
    <String, dynamic>{
      'push_group_id': instance.pushGroupId,
      'push_group_name': instance.pushGroupName,
      'is_check': instance.isCheck,
    };
