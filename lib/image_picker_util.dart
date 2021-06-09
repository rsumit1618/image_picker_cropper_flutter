
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtil {
  ImagePickerUtil._privateConstructor();

  static final ImagePickerUtil instance = ImagePickerUtil._privateConstructor();

  final _imagePicker = ImagePicker();

  Future<String> getImage(
      {ImageSource source = ImageSource.gallery,
        CameraDevice cameraSide = CameraDevice.front}) async {
    final image = await _imagePicker.getImage(
        source: source, preferredCameraDevice: cameraSide,imageQuality: 100);

    if (image != null) {
      final File cropped = await ImageCropper.cropImage(
          sourcePath: image.path,
          // aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 90,
          // maxWidth: 400,
          // maxHeight: 400,
          cropStyle: CropStyle.rectangle,
          compressFormat: ImageCompressFormat.png,
          androidUiSettings: AndroidUiSettings(
            toolbarColor: Colors.blue,
            toolbarTitle: "Edit",
            statusBarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: false,
            initAspectRatio: CropAspectRatioPreset.original,
          ));

      if (cropped != null) {
        return cropped.path;
      } else {
        return '';
      }
    }

    return '';
  }
}
