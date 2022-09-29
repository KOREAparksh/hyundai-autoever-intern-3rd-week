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
  final _headerHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _title, hasStar: true),
      body: Container(
        margin: EdgeInsets.only(left: _bodySideMargin, right: _bodySideMargin),
        child: GroupedListView<PushHistoryDto, DateTime>(
          elements: _list,
          groupBy: (element) => element.pushDateTime,
          cacheExtent: _list.length + 5,
          itemBuilder: _itemBuilder,
          groupHeaderBuilder: (element) => _groupHeader(element),
          useStickyGroupSeparators: true,
        ),
      ),
    );
  }

  Widget _itemBuilder(context, PushHistoryDto element) =>
      PushHistoryListTile(data: element);

  Widget _indexBuilder(context, PushHistoryDto element, int i) =>
      PushHistoryListTile(data: element);

  Widget _groupHeader(PushHistoryDto element) {
    return Container(
      // color: Colors.red,
      height: _headerHeight,
      alignment: Alignment.centerLeft,
      child: Text(
        DateFormat("yyyy-MM-dd").format(element.pushDateTime),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
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
  final _topBottomMargin = 10.0;
  final _radius = 20.0;
  final _rowHeight = 25.0;
  final _stateWidth = 50.0;
  final _stateHeight = 15.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: _topBottomMargin, bottom: _topBottomMargin),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
        elevation: 5,
        color: Colors.white,
        shadowColor: Color(0x2b333333),
        child: Container(
          width: _width,
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
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
        ),
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

class PushHistoryListDetailTile extends StatelessWidget {
  const PushHistoryListDetailTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  final PushHistoryDto data;

  final _width = 330.0;
  final _topBottomMargin = 10.0;
  final _radius = 20.0;
  final _stateWidth = 20.0;
  final _stateHeight = 15.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: _topBottomMargin, bottom: _topBottomMargin),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_radius),
        ),
        elevation: 5,
        color: Colors.white,
        shadowColor: Color(0x2b333333),
        child: Container(
          width: _width,
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(
            children: [
              _form(child: _timeContainer()),
              Container(height: 1, color: Colors.black),
              _form(child: _infoForm(name: data.userName, id: data.userId)),
              _form(
                child:
                    _infoForm(name: data.deviceDescription, id: data.deviceId),
              ),
              Container(height: 1, color: Colors.black),
              SizedBox(height: 5),
              _pushTitle(),
              _form(child: _pushContents()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pushContents() =>
      Text(data.pushContent, overflow: TextOverflow.ellipsis);

  Widget _pushTitle() {
    return Container(
      height: 30,
      alignment: Alignment.centerLeft,
      child: Text(
        data.pushTitle,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _timeContainer() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _timeForm(
              title: "푸시",
              time: DateFormat("yy/MM/dd hh:mm:ss").format(data.pushDateTime)),
        ),
        Expanded(
          flex: 1,
          child: _timeForm(
              title: "수신",
              time: DateFormat("yy/MM/dd hh:mm:ss").format(data.sentDateTime)),
        ),
        Container(
          width: _stateWidth,
          height: _stateHeight,
          color: Colors.green,
          alignment: Alignment.center,
          child: Text(
            data.sentState,
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ],
    );
  }

  Widget _form({required Widget child}) {
    return Container(
      height: 25,
      alignment: Alignment.centerLeft,
      child: child,
    );
  }

  Widget _timeForm({required String title, required String time}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        Text(
          time,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12, color: textLight),
        ),
      ],
    );
  }

  Widget _infoForm({required String name, required String id}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Text(id, style: TextStyle(fontSize: 12, color: textLight)),
      ],
    );
  }
}
