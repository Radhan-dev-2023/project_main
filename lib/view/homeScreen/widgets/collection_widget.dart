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
      height: 5.h,
      width: 10.w,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
        color: color,
        // color: color,
        // color: const Color(0xFF7214FF),
        // color: Color(0xFFC5714E),
      ),
    );
  }
}
