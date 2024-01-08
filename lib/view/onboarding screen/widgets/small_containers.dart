import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer(
      {super.key, required this.color, this.index, this.curentindex});
  final Color color;
  final int? index;
  final int? curentindex;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0.sp),
      width: 15.sp,
      height: 10.sp,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
