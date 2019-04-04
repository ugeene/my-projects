import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtil {
  static final AppUtil _instance = new AppUtil.internal();
  static bool networkStatus;

  AppUtil.internal();

  factory AppUtil() {
    return _instance;
  }


  bool isNetworkWorking() {
    return networkStatus;
  }

  void showAlert(String msg) {
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


}