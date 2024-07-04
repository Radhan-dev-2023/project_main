import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Collectionwidget extends StatelessWidget {
  final String image;
  final Color? color;
  const Collectionwidget({
    super.key,
    required this.image,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3.5.h,
      width: 7.5.w,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
        color: color,
      ),
    );
  }
}
