import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/controller/top%20fund%20controller/top_fund_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/top%20mfs/screen_top_mfs.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenTopFunds extends StatelessWidget {
  const ScreenTopFunds({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<TopFundController>(context, listen: false)
        .getSchemeAllCategory(context);
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Funds'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenAllMutualFund(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
              color: platformBrightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Expanded(
              child: Consumer<TopFundController>(
                  builder: (context, topfundController, child) {
                return topfundController.loading == true
                    ? const LoadingWidget()
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 5,
                            child: ListTile(
                              title: Text(
                                '${topfundController.schemeAllCategoryModel?.list?[index]}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TopMfsScreen(
                                          category:
                                              '${topfundController.schemeAllCategoryModel?.list?[index]}'),
                                    ));
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            VerticalSpacer(1.h),
                        itemCount: topfundController
                            .schemeAllCategoryModel!.list!.length,
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}
