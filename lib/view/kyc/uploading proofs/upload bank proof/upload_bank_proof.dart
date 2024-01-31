import 'package:finfresh_mobile/controller/uploading%20proofs/uploading_proof_controller.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/kyc/uploading%20proofs/upload%20bank%20proof/widgets/for_bank_proof.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenBankProofs extends StatefulWidget {
  const ScreenBankProofs({super.key});

  @override
  State<ScreenBankProofs> createState() => _ScreenBankProofsState();
}

class _ScreenBankProofsState extends State<ScreenBankProofs> {
  @override
  void initState() {
    super.initState();
    Provider.of<UploadingProof>(context, listen: false).getBankCode();
    Provider.of<UploadingProof>(context, listen: false).image = null;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // log('username is ${Provider.of<KycController>(context, listen: false).username}');
    });

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
                      'Upload Your Bank Proof',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 19.sp, fontWeight: FontWeight.w700),
                    ),
                    VerticalSpacer(2.h),
                    Text(
                      'Upload your bank proof to complete your KYC',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                    VerticalSpacer(4.h),
                    ForBankProof(brightness: brightness),
                    VerticalSpacer(4.h),
                    InkWell(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
          floatingActionButton: uploadingproofController.bankProofUpload == true
              ? const LoadingButton()
              : ButtonWidget(
                  btName: 'Submit'.toUpperCase(),
                  onTap: uploadingproofController.image == null
                      ? () {
                          showSnackBar(context, 'Please upload the proof');
                        }
                      : () async {
                          bool result = await uploadingproofController
                              .uploadBankProof(context);
                          if (result == true) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScreenHomeView(),
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