import 'package:finfresh_mobile/controller/uploading%20proofs/uploading_proof_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForBankProof extends StatelessWidget {
  const ForBankProof({
    super.key,
    required this.brightness,
  });

  final Brightness brightness;

  @override
  Widget build(BuildContext context) {
    final uploadingproofController = Provider.of<UploadingProof>(context);
    return SizedBox(
      child: Column(
        children: [
          Container(
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
            height: 60,
            // width: 120,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                value: uploadingproofController.pOAValue,
                isExpanded: true,
                underline: Container(
                  height: 0,
                ),
                items: uploadingproofController.poaList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  uploadingproofController.updatepoaValue(value);
                },
              ),
            ),
          ),
          VerticalSpacer(3.h),
          uploadingproofController.pOAValue == 'Yes'
              ? Container(
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
                  height: 60,
                  // width: 120,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      value: uploadingproofController.pOABankTypeValue,
                      isExpanded: true,
                      underline: Container(
                        height: 0,
                      ),
                      items: uploadingproofController.poaBankTypeList
                          .map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        uploadingproofController.updatepoaBankTypeValue(value);
                      },
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
