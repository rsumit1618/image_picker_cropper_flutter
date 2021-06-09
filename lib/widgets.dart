import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SettingDialog extends StatelessWidget {
  final String enableOrDisable;

  SettingDialog({this.enableOrDisable});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "$enableOrDisable Permission",
        style: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 18,
          color: Colors.blue,
        ),
      ),
      content: Text('Allow Contact permission to access phonebook contact.',
        style: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
             'Dismiss',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                color: Colors.blue,
              ),
            )),
        FlatButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(context);
            },
            child: Text(
              'Open',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 14,
                color: Colors.blue,
              ),
            )),
      ],
    );
  }
}
