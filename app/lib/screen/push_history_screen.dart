import 'package:app/const/Color.dart';
import 'package:app/dto/push_history_dto.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

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
      pushTitle: "This is letter",
      pushContent: "이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
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
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "2",
      deviceDescription: "ipad",
      pushTitle: "3This is letter",
      pushContent: "3이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 06, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter2",
      pushContent: "2이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 07, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter2",
      pushContent: "2이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 07, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter2",
      pushContent: "2이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 07, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "1",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "note10",
      pushTitle: "This is letter2",
      pushContent: "2이 편지는 영국으로부터 시작되어 한국으로 온지 약 3년정도 된거 같기도 하고 아닌거 같기도 하고",
      pushDateTime: DateTime.utc(2022, 08, 07, 12, 02, 43),
      sentDateTime: DateTime.utc(2022, 08, 07, 12, 04, 00),
      sentState: "Y",
    ),
    PushHistoryDto(
      userId: "2",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "iphone",
      pushTitle: "iphone",
      pushContent: "steve jobs",
      pushDateTime: DateTime.utc(2022, 08, 15),
      sentDateTime: DateTime.utc(2022, 08, 15),
      sentState: "N",
    ),
    PushHistoryDto(
      userId: "2",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "iphone",
      pushTitle: "iphone",
      pushContent: "steve jobs",
      pushDateTime: DateTime.utc(2022, 08, 15),
      sentDateTime: DateTime.utc(2022, 08, 15),
      sentState: "N",
    ),
    PushHistoryDto(
      userId: "2",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "iphone",
      pushTitle: "iphone",
      pushContent: "steve jobs",
      pushDateTime: DateTime.utc(2022, 08, 15),
      sentDateTime: DateTime.utc(2022, 08, 15),
      sentState: "N",
    ),
    PushHistoryDto(
      userId: "2",
      userName: "psh",
      deviceId: "1",
      deviceDescription: "iphone",
      pushTitle: "iphone",
      pushContent: "steve jobs",
      pushDateTime: DateTime.utc(2022, 08, 15),
      sentDateTime: DateTime.utc(2022, 08, 15),
      sentState: "N",
    ),
  ];

  final _bodySideMargin = 27.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _title, hasStar: true),
      body: Container(
        margin: EdgeInsets.only(left: _bodySideMargin, right: _bodySideMargin),
        child: GroupedListView<PushHistoryDto, DateTime>(
          elements: _list,
          groupBy: (element) => element.pushDateTime,
          groupSeparatorBuilder: (DateTime groupByValue) =>
              Text(groupByValue.toString()),
          itemBuilder: (context, PushHistoryDto element) =>
              PushHistoryListTile(data: element),
          useStickyGroupSeparators: true,
          floatingHeader: true,
          stickyHeaderBackgroundColor: Colors.red,
        ),
      ),
    );
  }
}

class PushHistoryListTile extends StatelessWidget {
  const PushHistoryListTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final PushHistoryDto data;

  final _width = 330.0;
  final _innerPadding = 15.0;
  final _radius = 20.0;
  final _rowHeight = 25.0;
  final _stateWidth = 50.0;
  final _stateHeight = 15.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      padding: EdgeInsets.all(_innerPadding),
      decoration: BoxDecoration(
        border: Border.all(color: boxBorderDisable),
        borderRadius: BorderRadius.circular(_radius),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _form(child: _times()),
          _form(child: _info()),
          Container(height: 2, color: Colors.black),
          _form(child: _pushTitle()),
          _form(child: _pushContents()),
        ],
      ),
    );
  }

  Widget _form({required Widget child}) {
    return SizedBox(height: _rowHeight, child: child);
  }

  Widget _times() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text("푸시", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text(DateFormat("hh:mm:ss").format(data.pushDateTime)),
          ],
        ),
        Row(
          children: [
            Text("수신", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 5),
            Text(DateFormat("yy/MM/dd hh:mm:ss").format(data.sentDateTime)),
          ],
        ),
      ],
    );
  }

  Widget _info() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(data.userName, overflow: TextOverflow.ellipsis)),
        Expanded(flex: 2, child: Text(data.deviceDescription)),
        Container(
          width: _stateWidth,
          height: _stateHeight,
          color: Colors.green,
          alignment: Alignment.center,
          child: Text(
            data.sentState,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _pushTitle() {
    return Container(
        alignment: Alignment.centerLeft, child: Text(data.pushTitle));
  }

  Widget _pushContents() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        data.pushContent,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
