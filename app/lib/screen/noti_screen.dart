import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class NotiScreen extends StatelessWidget {
  const NotiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasBack: true,
        title: "알림화면",
      ),
      body: Center(
        child: Text("알림화면"),
      ),
    );
  }
}
