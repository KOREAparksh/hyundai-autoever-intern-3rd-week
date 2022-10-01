import 'package:app/const/Color.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum DialogType { Confirm, OK }

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    Key? key,
    this.dialogType = DialogType.Confirm,
    required this.mainTitle,
    this.subTitle,
    this.contents,
    this.negativeButtonText = "아니요",
    this.positiveButtonText = "네",
    this.onTabNegative,
    required this.onTapPositive,
    this.dialogInsetPadding = 38,
  }) : super(key: key);

  final DialogType dialogType;
  final String mainTitle;
  final String? subTitle;
  final Widget? contents;
  final String negativeButtonText;
  final String positiveButtonText;
  final VoidCallback? onTabNegative;
  final VoidCallback onTapPositive;
  final double dialogInsetPadding;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final _bodyRadius = 10.0;
  final _bodyTopBottomMargin = 28.0;
  final _gapMargin = 16.0;
  final _buttonHeight = 36.0;
  final _buttonRadius = 20.0;
  final _buttonBetweenPadding = 12.0;
  late final _buttonSideMargin = EdgeInsets.only(left: 24, right: 24);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Dialog(
        insetPadding: EdgeInsets.all(widget.dialogInsetPadding),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_bodyRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: _bodyTopBottomMargin),
            _mainTitle(),
            _subTitle(),
            SizedBox(height: _gapMargin),
            _contents(),
            _buttons(),
            SizedBox(height: _bodyTopBottomMargin),
          ],
        ),
      ),
    );
  }

  Widget _mainTitle() {
    return Text(widget.mainTitle, textAlign: TextAlign.center);
  }

  Widget _subTitle() {
    if (widget.subTitle == null) {
      return Container();
    }
    return Text(
      widget.subTitle!,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 12, color: textLight),
    );
  }

  Widget _contents() {
    if (widget.contents == null) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.only(bottom: _gapMargin),
      child: widget.contents!,
    );
  }

  Widget _buttons() {
    if (widget.dialogType == DialogType.OK) {
      return _okButtons();
    }
    return _confirmButtons();
  }

  Widget _okButtons() {
    return Container(
      margin: _buttonSideMargin,
      child: SizedBox(
        width: double.infinity,
        height: _buttonHeight,
        child: _positiveButton(),
      ),
    );
  }

  Widget _confirmButtons() {
    return Container(
      margin: _buttonSideMargin,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: _buttonHeight,
              child: _negativeButton(),
            ),
          ),
          SizedBox(width: _buttonBetweenPadding),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: _buttonHeight,
              child: _positiveButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _negativeButton() {
    return OutlinedButton(
      onPressed: widget.onTabNegative,
      child: Text(widget.negativeButtonText),
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
        splashFactory: NoSplash.splashFactory,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_buttonRadius),
        ),
      ),
    );
  }

  Widget _positiveButton() {
    return OutlinedButton(
      onPressed: widget.onTapPositive,
      child: Text(widget.positiveButtonText),
      style: OutlinedButton.styleFrom(
        primary: Colors.white,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        backgroundColor: mainColor,
        splashFactory: NoSplash.splashFactory,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(_buttonRadius),
        ),
      ),
    );
  }
}
