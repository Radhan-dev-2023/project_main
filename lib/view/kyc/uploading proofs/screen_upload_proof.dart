import 'package:finfresh_mobile/controller/uploading%20proofs/uploading_proof_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/upload%20bank%20proof/upload_bank_proof.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/upload%20bank%20proof/widgets/for_bank_proof.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenUploadinProofs extends StatelessWidget {
  const ScreenUploadinProofs({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<UploadingProof>(context, listen: false).getBankCode();
    //   // log('username is ${Provider.of<KycController>(context, listen: false).username}');
    // });

    Brightness brightness = MediaQuery.of(context).platformBrightness;
    return Consumer<UploadingProof>(
      builder: (context, uploadingproofController, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.all(18.sp),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacer(10.h),
                    Text(
                      'Upload your proofs',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 19.sp, fontWeight: FontWeight.w700),
                    ),
                    VerticalSpacer(2.h),
                    Text(
                      'Upload your proofs to complete your KYC',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                    VerticalSpacer(4.h),
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
                          value: uploadingproofController.proofvalue,
                          isExpanded: true,
                          underline: Container(
                            height: 0,
                          ),
                          items: uploadingproofController.proofList
                              .map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            uploadingproofController.updateProofValue(value);
                          },
                        ),
                      ),
                    ),
                    uploadingproofController.proofvalue == "Bank Proof"
                        ? VerticalSpacer(3.h)
                        : const SizedBox(),
                    uploadingproofController.proofvalue == "Bank Proof"
                        ? ForBankProof(brightness: brightness)
                        : const SizedBox(),
                    uploadingproofController.proofvalue == "ACH Form"
                        ? VerticalSpacer(3.h)
                        : const SizedBox(),
                    uploadingproofController.proofvalue == "ACH Form"
                        ? TextFormField(
                            style: Theme.of(context).textTheme.labelLarge!,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'field is required';
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter Ref No ',
                            ),
                          )
                        : const SizedBox(),
                    VerticalSpacer(3.h),
                    uploadingproofController.proofvalue == "POA cheque"
                        ? TextFormField(
                            style: Theme.of(context).textTheme.labelLarge!,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'field is required';
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter POABankSeq ',
                            ),
                          )
                        : const SizedBox(),
                    VerticalSpacer(4.h),
                    uploadingproofController.proofvalue == "Choose your proof"
                        ? const SizedBox()
                        : InkWell(
                            onTap: () {
                              showOptions(context);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.sp),
                              child: Container(
                                height: 30.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                                child: uploadingproofController.image == null
                                    ? const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.upload_file),
                                          Text('Upload your proofs'),
                                        ],
                                      )
                                    // : Image.asset(
                                    //     uploadingproofController.image!.path,
                                    //     fit: BoxFit.cover,
                                    //   )
                                    : Image.file(
                                        uploadingproofController.image!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                    VerticalSpacer(15.h)
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: uploadingproofController.bankProofUpload ==
                      true ||
                  uploadingproofController.proofUpload == true
              ? const LoadingButton()
              : ButtonWidget(
                  btName: 'Submit'.toUpperCase(),
                  onTap: uploadingproofController.image == null
                      ? () {
                          showSnackBar(context, 'Please upload the proof');
                        }
                      : () async {
                          bool result = await uploadingproofController
                              .uploadProof(context);
                          if (result == true) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScreenBankProofs(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                ),
        );
      },
    );
  }

  Future showOptions(context) async {
    final uploadPhotoController =
        Provider.of<UploadingProof>(context, listen: false);
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text(
              'Photo Gallery',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              uploadPhotoController.getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text(
              'Camera',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              uploadPhotoController.getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }
}
