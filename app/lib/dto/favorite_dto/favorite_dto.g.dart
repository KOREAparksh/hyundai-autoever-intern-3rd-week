// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteDto _$FavoriteDtoFromJson(Map<String, dynamic> json) => FavoriteDto(
      json['screen_id'] as String,
      json['screen_url'] as String,
      json['screen_name'] as String,
    );

Map<String, dynamic> _$FavoriteDtoToJson(FavoriteDto instance) =>
    <String, dynamic>{
      'screen_id': instance.screenId,
      'screen_url': instance.screenUrl,
      'screen_name': instance.screenName,
    };
