import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/event_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/chart_widget.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/news_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliverlistWidget extends StatelessWidget {
  const SliverlistWidget({
    super.key,
    required int currentIndex,
    required TabController tabController,
  })  : _currentIndex = currentIndex,
        _tabController = tabController;

  final int _currentIndex;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    // final GlobalKey sliverListKey = GlobalKey();
    final ScrollController _scrollController = ScrollController();
    final List<SalesData> data = [
      SalesData(1, '1D'),
      SalesData(5, '1W'),
      SalesData(1, '1M'),
      SalesData(1.3, '1Y'),
      SalesData(9.1, '5Y'),
      SalesData(1.4, 'ALL'),
    ];

    // _scrollController.addListener(() {
    //   if (_scrollController.offset > 150.0) {
    //     // Assuming you want to change the text when the scroll offset is greater than 150.0
    //     // You can modify this condition based on your requirements
    //     // Update the title in the FlexibleSpaceBar
    //     SliverAppBar sliverAppBar = sliverListKey.currentWidget as SliverAppBar;
    //     sliverAppBar = SliverAppBar(
    //       pinned: true,
    //       flexibleSpace: FlexibleSpaceBar(
    //         title: Text('Initial Text'),
    //       ),
    //     );
    //   } else {
    //     // Reset the title to the initial text
    //     SliverAppBar sliverAppBar = sliverListKey.currentWidget as SliverAppBar;
    //     sliverAppBar = SliverAppBar(
    //       pinned: true,
    //       title: Text('Initial Text'),
    //     );
    //   }
    // });

    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverAppBar(
                // pinned: true,
                // flexibleSpace: FlexibleSpaceBar(
                //   title: Text(''),
                // ),
                ),
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.all(18.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              height: 60,
                              width: 50,
                              child: FlutterLogo(),
                            ),
                            HorizontalSpacer(40.w),
                            const Icon(Icons.timer),
                            HorizontalSpacer(8.w),
                            const Icon(Icons.favorite_outline),
                            HorizontalSpacer(8.w),
                            const Icon(Icons.search)
                          ],
                        ),
                        VerticalSpacer(2.h),
                        Text(
                          'Vodafone India',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        VerticalSpacer(1.h),
                        const Text('₹17.05'),
                        VerticalSpacer(1.h),
                        const Text('+0.05(0.29%) 1D'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ChartWidget(
                data: data,
              ),
            ),
            // _currentIndex == 0
            //     ? SliverAppBar(
            //         actions: [
            //           Icon(Icons.search),
            //           Icon(Icons.search),
            //           Icon(Icons.search),
            //         ],
            //         floating: true,
            //         //  elevation: 0,
            //         expandedHeight: 200,
            //         flexibleSpace: FlexibleSpaceBar(
            //           title: Text('vodafone india'),
            //           background: Image.network(
            //             'https://example.com/your_background_image.jpg',
            //             fit: BoxFit.cover,
            //           ),
            //           collapseMode: CollapseMode.pin,
            //           titlePadding: EdgeInsets.all(16.0),
            //           centerTitle: true,

            //         ),
            //         pinned: true,
            //       )
            //     : const SliverToBoxAdapter(
            //         child: SizedBox(),
            //       ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 15,
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  padding: const EdgeInsets.all(7),
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Overview'),
                    Tab(text: 'Events'),
                    Tab(text: 'News'),
                    Tab(text: 'F&Q'),
                  ],
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                  labelStyle: const TextStyle(fontSize: 14),
                  labelColor: Colors.white,
                  unselectedLabelColor:
                      Theme.of(context).textTheme.bodyMedium!.backgroundColor,
                  indicator: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            OverViewInTabbar(),
            ScreenEventinTabBar(),
            NewsinTabBar(),
            Center(child: Text('F&Q')),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: const Color(0xFF0E1330),
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class SalesData {
  SalesData(this.year, this.month);

  final double year;
  final String month;
}
