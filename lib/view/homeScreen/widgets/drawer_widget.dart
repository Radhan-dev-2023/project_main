import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/fatcha%20registration/fatcha_registeration.dart';
import 'package:finfresh_mobile/view/settings%20page/screen_settings.dart';
import 'package:finfresh_mobile/view/top%20funds/top_funds.dart';
import 'package:finfresh_mobile/view/transaction%20screen/screen_transaction.dart';
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
                  VerticalSpacer(3.h),
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
                  VerticalSpacer(1.h),
                  Text(
                    'IIN : ${dashBoardController.dashBoardModel?.result?.data?.iin ?? ''}',
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
              'All Mutual Funds',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenAllMutualFund(),
                ),
              );
              Provider.of<TopMFsController>(context, listen: false)
                  .queryController
                  .clear();
              Provider.of<TopMFsController>(context, listen: false).returns =
                  '3 year';
              Provider.of<TopMFsController>(context, listen: false)
                  .returntoBackend = '3y';
              Provider.of<TopMFsController>(context, listen: false)
                  .getTopMfsFRomPeriod(context, 'All');
            },
          ),
          ListTile(
            title: Text(
              'FATCA Registration',
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
          ListTile(
            title: Text(
              'Transactions',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreeenTranscations(),
                  ));
            },
          ),
          ListTile(
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenSettings(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
