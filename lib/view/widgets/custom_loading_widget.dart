import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Container(
      height: 85.h,
      color: Colors.transparent,
      child: Center(
        child: CupertinoActivityIndicator(
            color: brightness == Brightness.dark ? Colors.white : Colors.black),
      ),
    );
  }
}
