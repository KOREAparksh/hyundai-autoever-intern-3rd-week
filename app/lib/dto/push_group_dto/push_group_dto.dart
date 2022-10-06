import 'package:json_annotation/json_annotation.dart';
part 'push_group_dto.g.dart';

@JsonSerializable()
class PushGroupDto {
  @JsonKey(name: "push_group_id")
  String pushGroupId;

  @JsonKey(name: "push_group_name")
  String pushGroupName;

  @JsonKey(name: "is_check")
  bool isCheck;

  PushGroupDto(this.pushGroupId, this.pushGroupName, this.isCheck);

  factory PushGroupDto.fromJson(Map<String, dynamic> json) =>
      _$PushGroupDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PushGroupDtoToJson(this);

  @override
  String toString() {
    return 'PushGroupDto{pushGroupId: $pushGroupId, pushGroupName: $pushGroupName, isCheck: $isCheck}';
  }
}
