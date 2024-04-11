import 'package:finfresh_mobile/controller/scheme%20details%20controller/scheme_details_controller.dart';
import 'package:finfresh_mobile/model/historical%20nav%20model/historical_nav_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
    required this.scheme,
  });
  final String scheme;
  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.green.withOpacity(0.8));
    color.add(Colors.green.withOpacity(0.4));
    final List<Color> colorLose = <Color>[];
    colorLose.add(Colors.red.withOpacity(0.8));
    colorLose.add(Colors.red.withOpacity(0.4));
    // final LinearGradient gradientColors = LinearGradient(
    //   colors: color,
    // );
    Brightness brightness = Theme.of(context).brightness;

    //     .getChartValue(context, scheme);
    // final schemeController = Provider.of<SchemeDetailsController>(context);

    return Consumer<SchemeDetailsController>(
        builder: (context, schemeController, child) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            child: SizedBox(
              height: 35.h,
              child: schemeController.detailScreenLoading == true
                  ? const LoadingWidget()
                  : schemeController.historicalNavModel != null
                      ? SfCartesianChart(
                          zoomPanBehavior: ZoomPanBehavior(
                            enablePinching: true,
                            enableDoubleTapZooming: true,
                            enablePanning: true,
                          ),
                          margin: const EdgeInsets.all(0),
                          enableAxisAnimation: true,
                          plotAreaBorderWidth: 0,
                          primaryYAxis: const NumericAxis(
                            isVisible: false,
                          ),
                          primaryXAxis: const CategoryAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            isVisible: false,
                          ),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <CartesianSeries>[
                            AreaSeries<NavDetails, dynamic>(
                              borderColor: schemeController.historicalNavModel!
                                              .navList![0].netAssetValue! -
                                          schemeController
                                              .historicalNavModel!
                                              .navList![schemeController
                                                      .historicalNavModel!
                                                      .navList!
                                                      .length -
                                                  1]
                                              .netAssetValue! >=
                                      0
                                  ? Colors.red
                                  : Colors.green,
                              dataSource:
                                  schemeController.historicalNavModel?.navList,
                              xValueMapper: (NavDetails nav, _) =>
                                  nav.navDateString,
                              yValueMapper: (NavDetails nav, _) =>
                                  nav.netAssetValue,
                              legendIconType: LegendIconType.horizontalLine,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: schemeController.historicalNavModel!
                                                .navList![0].netAssetValue! -
                                            schemeController
                                                .historicalNavModel!
                                                .navList![schemeController
                                                        .historicalNavModel!
                                                        .navList!
                                                        .length -
                                                    1]
                                                .netAssetValue! >=
                                        0
                                    ? colorLose
                                    : color,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
            ),
          ),
          VerticalSpacer(3.h),
          Padding(
            padding: EdgeInsets.only(left: 15.sp),
            child: SizedBox(
              height: Adaptive.h(4),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        schemeController.updatemonthvalue(
                          schemeController.monthvalue[index],
                        );
                        schemeController.updateCurrent(index);
                        schemeController.getChartValue(context, scheme);
                      },
                      child: Container(
                        width: Adaptive.w(11),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.grey),
                          color: schemeController.curentIndexForChart == index
                              ? const Color(0xFF4D84BD)
                              : const Color.fromARGB(255, 243, 238, 238),
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        child: Center(
                            child: Text(
                          schemeController.monthvalue[index],
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color:
                                  schemeController.curentIndexForChart == index
                                      ? Colors.white
                                      : Colors.black),
                        )),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => HorizontalSpacer(3.w),
                  itemCount: schemeController.monthvalue.length),
            ),
          ),
          // Positioned(
          //   right: 10.sp,
          //   top: 0,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //           color: brightness == Brightness.dark
          //               ? Colors.white
          //               : Colors.black),
          //       borderRadius: BorderRadius.circular(8),
          //       color: brightness == Brightness.light
          //           ? Colors.white
          //           : const Color(0xFF0E1330),
          //     ),
          //     height: 5.h,

          //     // width: 120,
          //     width: 18.w,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: DropdownButton(
          //         value: schemeController.selectValueForChart,
          //         isExpanded: true,
          //         underline: Container(
          //           height: 0,
          //         ),
          //         items: schemeController.monthvalue.map((String items) {
          //           return DropdownMenuItem(
          //             value: items,
          //             child: Text(
          //               items,
          //               style: Theme.of(context).textTheme.bodyMedium,
          //             ),
          //           );
          //         }).toList(),
          //         onChanged: (value) {
          //           schemeController.updatemonthvalue(value);
          //           schemeController.getChartValue(context, scheme);
          //         },
          //       ),
          //     ),
          //   ),
          // ),
        ],
      );
    });
  }
  //  List<Color> getColorList(List<NavDetails> data) {
  //   List<Color> colors = [];
  //   for (int i = 0; i < data.length - 1; i++) {
  //     if (data[i] < data[i + 1]) {
  //       colors.add(Colors.green);
  //     } else {
  //       colors.add(Colors.red);
  //     }
  //   }
  //   // The last color can be any color you want
  //   colors.add(Colors.green);
  //   return colors;
  // }
}
