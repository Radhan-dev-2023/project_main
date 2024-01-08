import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/sliver_list_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StockDetailsScreen extends StatefulWidget {
  const StockDetailsScreen({Key? key}) : super(key: key);

  @override
  State<StockDetailsScreen> createState() => _StockDetailsScreenState();
}

class _StockDetailsScreenState extends State<StockDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _currentIndex = 0;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      SliverlistWidget(
          currentIndex: _currentIndex, tabController: _tabController),
      SliverlistWidget(
          currentIndex: _currentIndex, tabController: _tabController),
    ];
    return Scaffold(
      body: widgetList[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 6.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: const Center(
              child: Text('SELL'),
            ),
          ),
          Container(
            height: 6.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: const Center(
              child: Text('Buy'),
            ),
          ),
        ],
      ),
    );
  }
}
