import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewsinTabBar extends StatelessWidget {
  const NewsinTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.all(15.sp),
        itemBuilder: (context, index) => SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Business insider India -2 hours',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey),
                  ),
                  VerticalSpacer(1.h),
                  const Text('Mixed december-While vodafone,idea sales rise'),
                ],
              ),
            ),
        separatorBuilder: (context, index) => const Divider(
              thickness: 0.2,
              color: Colors.grey,
            ),
        itemCount: 10);
  }
}
