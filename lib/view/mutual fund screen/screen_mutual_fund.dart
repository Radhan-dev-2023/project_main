import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/all%20mutual%20fund/screen_all_mutual_fund.dart';
import 'package:finfresh_mobile/view/mutual%20fund%20screen/widgets/goals_screen.dart';
import 'package:finfresh_mobile/view/mutual%20fund%20screen/widgets/widget_for_toppicks_goals.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/stock_detail_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenMutualFund extends StatelessWidget {
  const ScreenMutualFund({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TopMFsController>(context, listen: false)
          .callinginInit(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mutual Funds'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenAllMutualFund(),
                  ));
            },
            child: Icon(
              Icons.search,
              size: Adaptive.h(2.3),
            ),
          ),
          HorizontalSpacer(2.w)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Consumer<TopMFsController>(
            builder: (context, topMfsController, child) {
              if (topMfsController.lodingList == true) {
                return const LoadingWidget();
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Top Picks',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          WigetForTopPIcksAndGoals(
                            title: 'Sip under 500',
                            listname: topMfsController.sipUnder500list,
                            wigetInTrailing: const SizedBox(),
                            imageList: topMfsController.sipUnder500Logo,
                            isinList: topMfsController.isinForSip500,
                            categoryList: topMfsController.categoryList,
                          ),
                          WigetForTopPIcksAndGoals(
                            title: 'Finfresh pick',
                            listname: topMfsController.finfreshpickslist,
                            wigetInTrailing: const SizedBox(),
                            imageList: topMfsController.finfreshpickslistlogo,
                            isinList: topMfsController.finffreshtoppicksisin,
                          ),
                          WigetForTopPIcksAndGoals(
                            title: 'Tax savings',
                            listname: topMfsController.taxsavinginToppicks,
                            wigetInTrailing: const SizedBox(),
                            imageList: topMfsController.taxSavingIntopPicksLogo,
                            isinList: topMfsController.taxSavingIsin,
                          ),
                          WigetForTopPIcksAndGoals(
                            title: 'Sectoral',
                            listname: topMfsController.sectorlFundlist,
                            wigetInTrailing: const SizedBox(),
                            imageList: topMfsController.sectoralLogoList,
                            isinList: topMfsController.sectoralIsin,
                          ),
                        ],
                      ),
                    ),
                    VerticalSpacer(2.h),
                    Text(
                      'Goals',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(
                      height: Adaptive.h(48),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 10, // Spacing between columns
                          mainAxisSpacing: 10, // Spacing between rows
                        ),
                        itemCount: topMfsController.item.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScreenGolas(
                                      heading: topMfsController.item[index],
                                      image: topMfsController.imageList[index],
                                    ),
                                  ));
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.sp),
                              child: Card(
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      topMfsController.imageList[
                                          index], // Example image URL
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: Adaptive.h(16),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        width: 172,
                                        height: 45.5,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              stops: [0.3, 0.7],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                topMfsController
                                                    .colorList[index],
                                                topMfsController
                                                    .colorList[index]
                                                    .withOpacity(0.5)
                                              ], // Define your gradient colors
                                            ),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(15.sp),
                                                bottomRight:
                                                    Radius.circular(15.sp))),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 12.sp,
                                      left: 22.sp,
                                      child: Text(
                                        topMfsController.item[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    VerticalSpacer(2.h),
                    Text(
                      'All Funds',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    VerticalSpacer(2.h),
                    SizedBox(
                      height: Adaptive.h(75),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          topMfsController.returnValueallFunds(index);
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StockDetailsScreen(
                                    scheme:
                                        '${topMfsController.filteredListForAllFunds[index].schemeAmfi}',
                                    isinNumber: topMfsController
                                            .filteredListForAllFunds[index]
                                            .isinNo ??
                                        '',
                                    category: topMfsController
                                            .filteredListForAllFunds[index]
                                            .schemeCategory ??
                                        "",
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: SizedBox(
                                        height: 5.h,
                                        width: 10.w,
                                        child: Image.network(
                                          topMfsController
                                                  .filteredListForAllFunds[
                                                      index]
                                                  .logo ??
                                              '',
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const SizedBox();
                                          },
                                        ),
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${topMfsController.filteredListForAllFunds[index].schemeAmfi}',
                                            overflow: TextOverflow.visible,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                            maxLines: 2,
                                          ),
                                          VerticalSpacer(1.h),
                                        ],
                                      ),
                                      subtitle: Text(
                                        topMfsController
                                                .filteredListForAllFunds[index]
                                                .schemeCategory ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 16.sp,
                                                color: Colors.grey),
                                        overflow: TextOverflow.visible,
                                      ),
                                      trailing: Container(
                                        decoration: BoxDecoration(
                                          color: platformBrightness ==
                                                  Brightness.light
                                              ? const Color.fromARGB(
                                                      255, 253, 217, 214)
                                                  .withOpacity(0.5)
                                              : const Color(0xFFCC324C)
                                                  .withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(
                                            10.sp,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: 12.sp,
                                            right: 12.sp,
                                            top: 6.sp,
                                            bottom: 8.sp,
                                          ),
                                          child: Text(
                                            '${topMfsController.filteredListForAllFunds[index].riskometer}',
                                            style: TextStyle(
                                                color: topMfsController
                                                                .filteredListForAllFunds[
                                                                    index]
                                                                .riskometer ==
                                                            'Very High' ||
                                                        topMfsController
                                                                .filteredListForAllFunds[
                                                                    index]
                                                                .riskometer ==
                                                            'High'
                                                    ? Colors.red
                                                    : Colors.amber),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            VerticalSpacer(1.h),
                        itemCount:
                            topMfsController.filteredListForAllFunds.length > 5
                                ? 5
                                : topMfsController
                                    .filteredListForAllFunds.length,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: Adaptive.h(9),
                        width: Adaptive.w(45),
                        child: ButtonWidget(
                          btName: 'View More',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ScreenAllMutualFund(),
                                ));
                          },
                        ),
                      ),
                    ),
                    VerticalSpacer(10.h)
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
