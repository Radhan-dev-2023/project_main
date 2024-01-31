import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Collectionwidget extends StatelessWidget {
  final String image;
  const Collectionwidget({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 15.w,
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
