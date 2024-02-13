import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/fatcha%20registration/fatcha_registeration.dart';
import 'package:finfresh_mobile/view/top%20funds/top_funds.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF060B27),
            ),
            child: Consumer<DashBoardController>(
                builder: (context, dashBoardController, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacer(7.h),
                  Text(
                    '${dashBoardController.dashBoardModel?.result?.data?.name ?? ''}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  VerticalSpacer(.5.h),
                  Text(
                    dashBoardController
                            .dashBoardModel?.result?.data?.phoneNumber ??
                        '',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }),
          ),
          ListTile(
            title: Text(
              'Top Mutual Funds',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenTopFunds(),
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Fatcha Registration',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenFatchaRegistration(),
                  ));
            },
          ),
          // Add more ListTile widgets for additional items
        ],
      ),
    );
  }
}
