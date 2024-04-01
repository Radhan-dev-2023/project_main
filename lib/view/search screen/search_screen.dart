import 'package:finfresh_mobile/controller/search%20controller/search_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(15.sp),
        child: Consumer<SearchFundsController>(
            builder: (context, searchFundController, _) {
          return Column(
            children: [
              searchFundController.searchLoading == true
                  ?const LoadingWidget()
                  :  ListView.separated(itemBuilder:(context, index) {
                    return ListTile(
                      // title: Text(searchFundController.mutualfundmodel?.list[index]),
                    );
                  },  separatorBuilder: (context, index) => VerticalSpacer(1.h), itemCount: searchFundController.mutualfundmodel?.list?.length ?? 0)
            ],
          );
        }),
      ),
    );
  }
}
