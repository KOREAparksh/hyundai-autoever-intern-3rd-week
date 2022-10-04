import 'package:flutter/material.dart';

class LoginDummyScreen extends StatelessWidget {
  const LoginDummyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인화면"),
      ),
      body: Center(
        child: Text("로그인버튼"),
      ),
    );
  }
}
