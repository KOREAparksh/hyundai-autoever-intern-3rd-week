class PushHistoryDto {
  final String userId;
  final String userName;
  final String deviceId;
  final String deviceDescription;
  final String pushTitle;
  final String pushContent;
  final DateTime pushDateTime;
  final String sentState;
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
}
