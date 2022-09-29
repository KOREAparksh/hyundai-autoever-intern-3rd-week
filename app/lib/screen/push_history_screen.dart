import 'package:app/dto/push_history_dto.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class PushHistoryScreen extends StatefulWidget {
  const PushHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PushHistoryScreen> createState() => _PushHistoryScreenState();
}

class _PushHistoryScreenState extends State<PushHistoryScreen> {
  final _title = "푸시알림전송이력";

  final List<PushHistoryDto> _list = [
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter",
      pushContent: "이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 05, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 05, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter2",
      pushContent: "2이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 05, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 05, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 05, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 05, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "2",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "iphone",
      pushTitle: "iphone",
      pushContent: "steve jobs",
      pushDateTime: DateTime.utc(2022, 08, 15, 12, 22, 43),
      sentDateTime: DateTime.utc(2022, 08, 15, 14, 11, 00),
      sentState: "N",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _title, hasStar: true),
      body: Container(),
    );
  }
}
