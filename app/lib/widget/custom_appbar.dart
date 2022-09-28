import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.middleAsset,
    this.hasStar = false,
  }) : super(key: key);

  @override
  final Size preferredSize = const Size.fromHeight(72.0);

  final String? title;
  final String? middleAsset;
  final bool hasStar;

  //Size
  final _logoWidth = 100.0;

  //MarginPadding
  final _appBarLeadingMargin = 13.0;
  final _appBarTrailingMargin = 13.0;
  final _appBarTrailingInnerMargin = 7.0;
  final _appBarLogoBottomMargin = 5.0;

  //Asset
  final _logo = "assets/autoever_logo.png";

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: _middleWidget(),
      automaticallyImplyLeading: false,
    );
  }

  Widget _middleWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _actions(),
        _center(),
      ],
    );
  }

  Widget _actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _leading(),
        _trailing(),
      ],
    );
  }

  Widget _leading() {
    return Container(
      margin: EdgeInsets.only(left: _appBarLeadingMargin),
      child: _customIconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
    );
  }

  Widget _center() {
    return (title == null)
        ? Container(
            margin: EdgeInsets.only(bottom: _appBarLogoBottomMargin),
            child: Image.asset(_logo, width: _logoWidth))
        : Container(child: Text(title!, overflow: TextOverflow.ellipsis));
  }

  Widget _trailing() {
    return Container(
      margin: EdgeInsets.only(right: _appBarTrailingMargin),
      child: Row(
        children: _trailingList(),
      ),
    );
  }

  List<Widget> _trailingList() {
    List<Widget> _list = [];
    if (hasStar) {
      _list.add(_customIconButton(
        icon: Icon(Icons.star_border),
        onPressed: () {},
      ));
    }
    _list.add(SizedBox(width: _appBarTrailingInnerMargin));
    _list.add(_customIconButton(
      icon: Icon(Icons.notifications),
      onPressed: () {},
    ));
    return _list;
  }

  Widget _customIconButton({
    required VoidCallback onPressed,
    required Icon icon,
  }) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: onPressed,
      icon: icon,
    );
  }
}
