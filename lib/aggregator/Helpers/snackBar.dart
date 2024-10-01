import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void showSnackBar(String message) {

  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,

      timeInSecForIosWeb: 50,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(content: Text(message)),
  // );
}