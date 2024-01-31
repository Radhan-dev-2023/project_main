import 'package:finfresh_mobile/controller/dash%20board%20controller/dash_board_controller.dart';
import 'package:finfresh_mobile/routes/routes.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AttensionWidget extends StatelessWidget {
  const AttensionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // InvestorModel investorModel = InvestorModel();
    final dashBoardController = Provider.of<DashBoardController>(context);
    return SizedBox(
      height: 28.h,
      width: double.infinity,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalSpacer(1.h),
            Icon(
              Icons.warning_outlined,
              color: Colors.red,
              size: 5.h,
            ),
            Text(
              'Attention required!',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                  ),
              // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            VerticalSpacer(1.h),
            Text(
                'Your KYC details are  ${dashBoardController.dashBoardModel?.result?.data?.activationStatus?.message}'),
            VerticalSpacer(2.h),
            ButtonWidget(
              btName: 'Complete KYC',
              onTap: () {
                Routes.dashboardToKycPage(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
