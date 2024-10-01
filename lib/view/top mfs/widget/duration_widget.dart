import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DurationButton extends StatefulWidget {
  final String category;
  const DurationButton({
    super.key,
    required this.category,
  });

  @override
  State<DurationButton> createState() => _DurationButtonState();
}

class _DurationButtonState extends State<DurationButton> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(
        initialPage: Provider.of<TopMFsController>(context, listen: false)
            .indexforDuration);
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
                if (pageController.page!.round() > 0) {
                  pageController.previousPage(
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
            HorizontalSpacer(2.w),
            SizedBox(
              height: Adaptive.h(2.5),
              width: Adaptive.w(15),
              child: PageView.builder(
                onPageChanged: (value) {
                  topMfsController.changeValueinDuration(
                      topMfsController.dataList[value], value);
                  topMfsController.getTopMfsFRomPeriod(
                      context, widget.category, 'All Mutual fund');
                },
                controller: pageController,
                itemCount: topMfsController.dataList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Text(
                    topMfsController.dataList[index],
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w400,
                          // letterSpacing: 3.5.sp,
                        ),
                  );
                },
              ),
            ),
            // HorizontalSpacer(1.w),
            InkWell(
              onTap: () {
                if (pageController.page! <
                    topMfsController.dataList.length - 1) {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                } else {
                  // If at last index, go back to the first index
                  pageController.jumpToPage(0);
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
