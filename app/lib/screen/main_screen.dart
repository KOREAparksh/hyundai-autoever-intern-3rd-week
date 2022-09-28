import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasStar: true,
        title: "132213123213asdfasdfadsfasdfsdfsdf",
      ),
      body: Container(),
    );
  }
}
