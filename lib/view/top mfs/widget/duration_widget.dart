import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DurationButton extends StatelessWidget {
  final String category;
  const DurationButton({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TopMFsController>(builder: (context, topMfsController, _) {
      return SizedBox(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (topMfsController.pageController.page!.round() > 0) {
                  topMfsController.pageController.previousPage(
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
              width: Adaptive.w(15),
              child: PageView.builder(
                onPageChanged: (value) {
                  topMfsController
                      .changeValueinDuration(topMfsController.dataList[value]);
                  topMfsController.getTopMfsFRomPeriod(context, category);
                },
                controller: topMfsController.pageController,
                itemCount: topMfsController.dataList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Text(
                    topMfsController.dataList[index],
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                if (topMfsController.pageController.page! <
                    topMfsController.dataList.length - 1) {
                  topMfsController.pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                } else {
                  // If at last index, go back to the first index
                  topMfsController.pageController.jumpToPage(0);
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
