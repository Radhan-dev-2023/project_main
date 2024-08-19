import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/mutual%20fund%20screen/widgets/custom_fund_wiget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FundsWidget extends StatelessWidget {
  const FundsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Funds',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          VerticalSpacer(2.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFundWidget(
                category: 'Index Fund',
                appbarname: 'Index Fund',
                fundName: 'Index Fund',
                imageurl: 'assets/images/toppicks/index-fund (2) 1.png',
              ),
              CustomFundWidget(
                category: 'Equity: Elss',
                appbarname: 'Tax Saving',
                fundName: 'Tax Saving',
                imageurl:
                    'assets/images/toppicks/wired-outline-453-savings-pig 1.png',
              ),
              CustomFundWidget(
                category: 'Equity: Flexi Cap',
                appbarname: 'Flexi Cap',
                fundName: 'Flexi Cap',
                imageurl: 'assets/images/toppicks/loan (2) 1.png',
              ),
            ],
          ),
          VerticalSpacer(1.h),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFundWidget(
                category: 'Equity: Large Cap',
                appbarname: 'Large Cap',
                fundName: 'Large Cap',
                imageurl: 'assets/images/toppicks/resilience (1).png',
              ),
              CustomFundWidget(
                category: 'Equity: Mid Cap',
                appbarname: 'Mid Cap',
                fundName: 'Mid Cap',
                imageurl: 'assets/images/toppicks/growth (1).png',
              ),
              CustomFundWidget(
                category: 'Equity: Small Cap',
                appbarname: 'Small Cap',
                fundName: 'Small Cap',
                imageurl: 'assets/images/toppicks/graphic (1).png',
              ),
            ],
          ),
          VerticalSpacer(1.h),
          const Row(
            children: [
              CustomFundWidget(
                category: 'Equity: Sectoral-Infrastructure',
                appbarname: 'Sectoral',
                fundName: 'Sectoral',
                imageurl: 'assets/images/toppicks/crowd-funding (1) 1.png',
              ),
              CustomFundWidget(
                fundName: 'All Funds',
                imageurl: 'assets/images/toppicks/charity 1.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
