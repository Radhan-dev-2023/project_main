import 'package:finfresh_mobile/controller/top%20MFs%20controller/top_mfs_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TopMFsController>(
      builder: (context, snapshot, child) {
        return Container(
          height: Adaptive.h(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            border: Border.all(color: const Color.fromARGB(255, 192, 191, 191)),
          ),
          child: Form(
            key: GlobalKey<FormState>(),
            child: TextFormField(
              controller: snapshot.queryController,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 16.sp),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: Adaptive.h(2.3),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.0.sp),
                hintText: 'Search',
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  snapshot.searchItems();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
