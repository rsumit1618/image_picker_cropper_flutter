import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

extension AppWidgets on BuildContext {

  Future<T> showBottomSheet<T>({@required Widget sheet}) {
    return showCupertinoModalBottomSheet(
      context: this,
      expand: false,
      topRadius: Radius.zero,
      backgroundColor: Colors.white,
      builder: (context) => sheet,
    );
  }


  Future<T> pushAndRemoveAll<T>(CupertinoPageRoute<T> route) {
    return Navigator.pushAndRemoveUntil(this, route, (_) => false);
  }

  Future<T> push<T>(CupertinoPageRoute<T> route) {
    return Navigator.push(this, route);
  }
}