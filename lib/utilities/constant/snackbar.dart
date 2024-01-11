import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
      backgroundColor: const Color(0xFF0E1330),
    ),
  );
}
