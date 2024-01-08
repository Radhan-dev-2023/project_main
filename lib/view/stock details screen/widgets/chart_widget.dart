import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/sliver_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
    required this.data,
  });

  final List<SalesData> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: SfCartesianChart(
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

        // Chart title

        // Enable legend
        // legend: Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries<SalesData, dynamic>>[
          FastLineSeries<SalesData, dynamic>(
            // trendlines: [
            //   Trendline(
            //     type: TrendlineType.linear,
            //     width: 1,
            //     color: Colors.grey,
            //     dashArray: <double>[3, 3, 3, 3],
            //   ),
            // ],

            color: Colors.red,
            dataSource: data,
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.year,
            // name: 'Sales',
          ),
        ],
      ),
    );
  }

  List<double> generateData() {
    List<double> data = [];
    for (int i = 1; i <= 100; i++) {
      data.add(i.toDouble());
    }
    return data;
  }
}
