import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'image_picker_util.dart';

class HomePage extends StatefulWidget {
  var filePath;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                widget.filePath = await ImagePickerUtil.instance.getImage(
                    source: ImageSource.camera, cameraSide: CameraDevice.rear);
                // Navigator.pop(context);
              },
              child: Text(
                'Camera',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.pinkAccent,
              onPressed: () async {
                widget.filePath = await ImagePickerUtil.instance.getImage();
                // Navigator.pop(context);
              },
              child: Text(
                'Gallery',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () async {
                final PermissionStatus status =
                    await Permission.contacts.request();
                if (status.isGranted) {
                  showDialog(
                      context: context,
                      builder: (context) => SettingDialog(
                            enableOrDisable: 'Disable',
                          ));
                } else if (status.isDenied) {
                  await Permission.contacts.request();
                } else if (status.isPermanentlyDenied) {
                  showDialog(
                      context: context,
                      builder: (context) => SettingDialog(
                            enableOrDisable: 'Disable',
                          ));
                }
              },
              child: Text(
                'Contact Permission',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
