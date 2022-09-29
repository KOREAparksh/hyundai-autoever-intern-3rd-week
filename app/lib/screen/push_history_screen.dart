import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class PushHistoryScreen extends StatelessWidget {
  const PushHistoryScreen({Key? key}) : super(key: key);

  final _title = "푸시알림전송이력";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _title,
      ),
    );
  }
}
