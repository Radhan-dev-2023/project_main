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
      width: double.infinity,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalSpacer(1.h),
            ListTile(
              contentPadding: EdgeInsets.only(
                left: 9.sp,
                right: 15.sp,
              ),
              leading: const SizedBox(),
              title: Text(
                'Attention required!',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 17.5.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.5.sp,
                      // color: Color(0xFFACB2BA),
                    ),
              ),
              subtitle: Text(
                'Complete Your KYC  ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
              ),
              trailing: InkWell(
                onTap: () {
                  Routes.dashboardToKycPage(context);
                },
                child: SizedBox(
                  width: Adaptive.w(23),
                  height: Adaptive.h(5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: const Color(0xFF6C8FF8),
                    ),
                    child: Center(
                      child: Text(
                        'Activate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
