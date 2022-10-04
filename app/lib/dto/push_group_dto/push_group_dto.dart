class PushGroupDto {
  String pushGroupId;
  String pushGroupName;
  bool isCheck;

  PushGroupDto(this.pushGroupId, this.pushGroupName, this.isCheck);

  @override
  String toString() {
    return 'PushGroupDto{pushGroupId: $pushGroupId, pushGroupName: $pushGroupName, isCheck: $isCheck}';
  }
}
