import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class DeviceRegisterScreen extends StatelessWidget {
  const DeviceRegisterScreen({Key? key}) : super(key: key);

  final _title = "모바일기기등록";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _title,
        hasStar: true,
      ),
      body: Container(),
    );
  }
}
