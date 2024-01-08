import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenEventinTabBar extends StatelessWidget {
  const ScreenEventinTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
              title: Text(
                'Board Meeting',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 16.sp),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('02 Nov 23-Auction Date'),
                  VerticalSpacer(1.h),
                  const Text(
                    'Meeting of the Board of Directors',
                    style: TextStyle(color: Colors.grey),
                  ),
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
