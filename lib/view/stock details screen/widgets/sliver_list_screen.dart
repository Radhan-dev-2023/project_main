import 'package:finfresh_mobile/controller/scheme%20details%20controller/scheme_details_controller.dart';
import 'package:finfresh_mobile/model/latest%20nav%20model/latest_nav_model.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/event_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/chart_widget.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/news_screen.dart';
import 'package:finfresh_mobile/view/stock%20details%20screen/widgets/overview_in_tabbar.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliverlistWidget extends StatefulWidget {
  const SliverlistWidget({
    super.key,
    required int currentIndex,
    required TabController tabController,
    required this.scheme,
  })  : _currentIndex = currentIndex,
        _tabController = tabController;
  final String scheme;
  final int _currentIndex;
  final TabController _tabController;

  @override
  State<SliverlistWidget> createState() => _SliverlistWidgetState();
}

class _SliverlistWidgetState extends State<SliverlistWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<SchemeDetailsController>(context, listen: false)
        .callingFunctionDetailScreen(context, widget.scheme);
  }

  @override
  Widget build(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    // final GlobalKey sliverListKey = GlobalKey();
    final ScrollController _scrollController = ScrollController();

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

    return Consumer<SchemeDetailsController>(
        builder: (context, schemeDetailsController, child) {
      return SafeArea(
        child: schemeDetailsController.detailScreenLoading == true
            ? const LoadingWidget()
            : NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      title: const Text('Scheme Info'),
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          )),
                      // pinned: true,
                      // flexibleSpace: FlexibleSpaceBar(

                      // ),
                      actions: [
                        Icon(
                          Icons.message,
                          color: brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                        HorizontalSpacer(5.w),
                        Icon(
                          Icons.shopping_cart,
                          color: brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                        HorizontalSpacer(2.w),
                      ],
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
                                VerticalSpacer(2.h),
                                Text(
                                  schemeDetailsController
                                          .schemeInfoModel?.schemeName ??
                                      '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                VerticalSpacer(1.h),
                                CustomTextWidget(
                                  text: schemeDetailsController
                                          .schemeInfoModel?.schemeCategory ??
                                      '',
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ChartWidget(scheme: widget.scheme),
                    ),
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
                          controller: widget._tabController,
                          tabs: const [
                            Tab(text: 'Overview'),
                            Tab(text: 'Events'),
                            Tab(text: 'News'),
                            Tab(text: 'F&Q'),
                          ],
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 5),
                          labelStyle: const TextStyle(fontSize: 14),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white,
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
                  controller: widget._tabController,
                  children: const [
                    OverViewInTabbar(),
                    ScreenEventinTabBar(),
                    NewsinTabBar(),
                    Center(child: Text('F&Q')),
                  ],
                ),
              ),
      );
    });
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
