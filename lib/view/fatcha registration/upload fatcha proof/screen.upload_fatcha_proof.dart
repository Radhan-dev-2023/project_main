import 'package:finfresh_mobile/controller/fatcha%20registration/fatcha_registration.dart';
import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/utilities/constant/snackbar.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenFatchaProof extends StatefulWidget {
  const ScreenFatchaProof({super.key});

  @override
  State<ScreenFatchaProof> createState() => _ScreenFatchaProofState();
}

class _ScreenFatchaProofState extends State<ScreenFatchaProof> {
  @override
  void initState() {
    super.initState();
    // Provider.of<UploadingProof>(context, listen: false).getBankCode();
    // Provider.of<UploadingProof>(context, listen: false).image = null;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // log('username is ${Provider.of<KycController>(context, listen: false).username}');
    });

    return Consumer<FatchaRegistrationController>(
      builder: (context, fatcharegistration, child) {
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
                      'Upload Your PanCard Image',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 19.sp, fontWeight: FontWeight.w700),
                    ),
                    VerticalSpacer(2.h),
                    Text(
                      'Upload your pancard image to complete fatcha registration',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontSize: 15.sp, fontWeight: FontWeight.w400),
                    ),
                    VerticalSpacer(4.h),
                    TextFormField(
                      controller: fatcharegistration.panController,
                      style: Theme.of(context).textTheme.labelLarge!,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        // fillColor: const Color(0xFF0E1330),
                        // filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'ABCDE1234F',

                        // labelText: 'Pan card number',
                      ),
                      //   inputFormatters: [
                      //   LengthLimitingTextInputFormatter(5), // Limit to 5 characters
                      //   FilteringTextInputFormatter.allow(RegExp(r'^[A-Z]*$')), // Allow only uppercase letters
                      // ],
                      // keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter PAN Card Number';
                        } else if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$')
                            .hasMatch(value)) {
                          return 'Invalid PAN format';
                        }
                        return null;
                      },
                    ),
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
                          child: fatcharegistration.image == null
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.upload_file),
                                    Text('Upload your proofs'),
                                  ],
                                )
                              : Image.file(
                                  fatcharegistration.image!,
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
          floatingActionButton: fatcharegistration.proofUpload == true
              ? const LoadingButton()
              : ButtonWidget(
                  btName: 'Submit'.toUpperCase(),
                  onTap: fatcharegistration.image == null
                      ? () {
                          showSnackBar(context, 'Please upload the proof');
                        }
                      : () async {
                          bool result =
                              await fatcharegistration.uploadProof(context);
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
        Provider.of<FatchaRegistrationController>(context, listen: false);
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
