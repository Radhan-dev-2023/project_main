import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ButtonWidget extends StatelessWidget {
  final String btName;
  final Function()? onTap;
  final Color? color;
  const ButtonWidget({
    super.key,
    required this.btName,
    this.onTap,
    this.color = const Color(0xFF4D84BD),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.sp),
      child: SizedBox(
        height: 6.h,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            // backgroundColor: Color(0xFFC5714E),
            // backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onTap,
          child: Text(
            btName,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
