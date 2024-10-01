import 'package:flutter/material.dart';


Widget mediumSpacing(BuildContext context){
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.1,
  );
}
Widget spacing(BuildContext context){
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.05,
  );
}

var styles = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(24, 24, 24, 1),
    fontSize: 10);
var style = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(24, 24, 24, 1),
    fontSize: 16);
// var spacing = const SizedBox(height: 40);