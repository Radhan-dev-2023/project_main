import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryToggleWidget extends StatefulWidget {
  const CategoryToggleWidget({super.key});

  @override
  State<CategoryToggleWidget> createState() => _CategoryToggleWidgetState();
}

class _CategoryToggleWidgetState extends State<CategoryToggleWidget> {
  @override
  void initState() {
    final durationProvider =
        Provider.of<TopMFsController>(context, listen: false);
    durationProvider.pageControllerForCategoryToggleButton =
        PageController(initialPage: durationProvider.currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TopMFsController>(builder: (context, topMfsController, _) {
      return SizedBox(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (topMfsController.pageControllerForCategoryToggleButton.page!
                        .round() >
                    0) {
                  topMfsController.pageControllerForCategoryToggleButton
                      .previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                  // topMfsController.getTopMfsFRomPeriod(context, category);
                }
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Color(0xFF4D84BD),
              ),
            ),

            SizedBox(
              height: Adaptive.h(2.5),
              width: Adaptive.w(25),
              child: PageView.builder(
                onPageChanged: (value) {
                  topMfsController.changeCurrentIndex(value);
                  topMfsController.getTopMfsFRomPeriod(context,
                      topMfsController.categoryList[value], 'All Mutual fund');
                  // topMfsController
                  //     .changeValueinDuration(topMfsController.dataList[value]);
                  // topMfsController.getTopMfsFRomPeriod(context, category);
                },
                controller:
                    topMfsController.pageControllerForCategoryToggleButton,
                itemCount: topMfsController.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Text(
                    topMfsController.categoryList[index],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          // letterSpacing: 3.5.sp,
                        ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ),
            ),
            // HorizontalSpacer(1.w),
            InkWell(
              onTap: () {
                if (topMfsController
                        .pageControllerForCategoryToggleButton.page! <
                    topMfsController.categoryList.length - 1) {
                  topMfsController.pageControllerForCategoryToggleButton
                      .nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                } else {
                  // If at last index, go back to the first index
                  topMfsController.pageControllerForCategoryToggleButton
                      .jumpToPage(0);
                }
              },
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Color(0xFF4D84BD),
              ),
            ),
          ],
        ),
      );
    });
  }
}
