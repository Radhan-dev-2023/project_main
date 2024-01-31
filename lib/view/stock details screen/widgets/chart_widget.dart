import 'package:finfresh_mobile/controller/scheme%20details%20controller/scheme_details_controller.dart';
import 'package:finfresh_mobile/model/historical%20nav%20model/historical_nav_model.dart';
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
    Brightness brightness = Theme.of(context).brightness;
    // Provider.of<SchemeDetailsController>(context, listen: false)
    //     .getChartValue(context, scheme);
    // final schemeController = Provider.of<SchemeDetailsController>(context);

    return Consumer<SchemeDetailsController>(
        builder: (context, schemeController, child) {
      return Stack(
        children: [
          SizedBox(
            height: 35.h,
            child: schemeController.detailScreenLoading == true
                ? const LoadingWidget()
                : SfCartesianChart(
                    // zoomPanBehavior: ZoomPanBehavior(
                    //   enablePanning: true,
                    // ),
                    margin: const EdgeInsets.all(0),
                    enableAxisAnimation: true,
                    plotAreaBorderWidth: 0,
                    primaryYAxis: const NumericAxis(

                        // isVisible: false,
                        ),
                    primaryXAxis: const CategoryAxis(
                      majorGridLines: MajorGridLines(width: 0),

                      // isVisible: false,
                    ),

                    // Chart title

                    // Enable legend
                    // legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CartesianSeries>[
                      FastLineSeries<NavDetails, dynamic>(
                        color: Colors.red,
                        dataSource:
                            schemeController.historicalNavModel?.navList,
                        xValueMapper: (NavDetails nav, _) => nav.navDateString,
                        yValueMapper: (NavDetails nav, _) => nav.netAssetValue,
                        legendIconType: LegendIconType.horizontalLine,

                        // name: 'Sales',
                      ),
                    ],
                  ),
          ),
          Positioned(
            right: 10.sp,
            top: 0,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
                borderRadius: BorderRadius.circular(8),
                color: brightness == Brightness.light
                    ? Colors.white
                    : const Color(0xFF0E1330),
              ),
              height: 5.h,

              // width: 120,
              width: 18.w,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: schemeController.selectValueForChart,
                  isExpanded: true,
                  underline: Container(
                    height: 0,
                  ),
                  items: schemeController.monthvalue.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(
                        items,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    schemeController.updatemonthvalue(value);
                    schemeController.getChartValue(context, scheme);
                  },
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
