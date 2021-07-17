import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileModels {
  // String userProfileImg;

  Future<bool> setUserImage(String s) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    return _prefs.setString("userProfileImg", s);
  }

  getUserImage() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String imgPath;

    imgPath = _prefs.getString("userProfileImg") ?? null;
    print("Image path in getUserImage: $imgPath");
    return imgPath;
  }

  dltImageValue() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove("userProfileImg");
  }

  imageFromBase64String(String s) {
    return Image.memory(
      base64Decode(s),
      fit: BoxFit.cover,
    );
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
