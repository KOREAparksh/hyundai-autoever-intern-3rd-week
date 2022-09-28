import 'package:app/const/Color.dart';
import 'package:app/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: Center(child: _FavoriteButton()),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({
    Key? key,
    this.title,
  }) : super(key: key);

  final _width = 136.0;
  final _height = 136.0;
  final _radius = 20.0;
  final _padding = 10.0;

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      padding: EdgeInsets.all(_padding),
      decoration: BoxDecoration(
        border: Border.all(
          color: (title == null) ? boxBorderDisable : mainColor,
        ),
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Center(
        child: Text(
          title ?? "Blank",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: (title != null) ? null : textDisable,
            fontWeight: (title != null) ? FontWeight.bold : null,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
