import 'package:json_annotation/json_annotation.dart';

part 'push_history_dto.g.dart';

@JsonSerializable()
class PushHistoryDto {
  @JsonKey(name: "user_id")
  final String userId;

  @JsonKey(name: "user_name")
  final String userName;

  @JsonKey(name: "device_id")
  final String deviceId;

  @JsonKey(name: "device_description")
  final String deviceDescription;

  @JsonKey(name: "push_title")
  final String pushTitle;

  @JsonKey(name: "push_content")
  final String pushContent;

  @JsonKey(name: "push_date_time")
  final DateTime pushDateTime;

  @JsonKey(name: "sent_state")
  final String sentState;

  @JsonKey(name: "sent_date_time")
  final DateTime sentDateTime;

  const PushHistoryDto({
    required this.userId,
    required this.userName,
    required this.deviceId,
    required this.deviceDescription,
    required this.pushTitle,
    required this.pushContent,
    required this.pushDateTime,
    required this.sentState,
    required this.sentDateTime,
  });

  factory PushHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$PushHistoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PushHistoryDtoToJson(this);
}
