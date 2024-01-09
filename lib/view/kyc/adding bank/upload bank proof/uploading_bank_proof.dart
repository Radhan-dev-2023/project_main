import 'dart:io';

import 'package:finfresh_mobile/utilities/constant/app_size.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/nominee%20type/screen_nominee_count.dart';
import 'package:finfresh_mobile/view/kyc/Nominee%20adding/screen_nominee.dart';
import 'package:finfresh_mobile/view/kyc/joint%20holders/join_holders_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScreenUploadingBankProof extends StatefulWidget {
  const ScreenUploadingBankProof({super.key});

  @override
  State<ScreenUploadingBankProof> createState() =>
      _ScreenUploadingBankProofState();
}

class _ScreenUploadingBankProofState extends State<ScreenUploadingBankProof> {
  File? _image;
  final picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  //Show options to get image from camera or gallery
  Future showOptions() async {
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
              getImageFromGallery();
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
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TextButton(
              //   child: Text('Select Image'),
              //   onPressed: ,
              // ),
              VerticalSpacer(6.h),
              Text(
                'Add your bank proof',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 19.sp, fontWeight: FontWeight.w700),
              ),
              VerticalSpacer(3.h),
              _image == null ? VerticalSpacer(35.h) : VerticalSpacer(4.h),
              Center(
                child: _image == null
                    ? IconButton(
                        onPressed: showOptions,
                        icon: Icon(
                          Icons.add,
                          size: 10.h,
                        ),
                      )
                    : Image.file(_image!),
              ),
              Center(
                child: Text(
                  _image == null ? 'Add bank proof' : '',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _image == null
          ? const SizedBox()
          : ButtonWidget(
              onTap: () {
                showAlertDialog(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ScreenAddingNominee(),
                //   ),
                // );
              },
              btName: 'Continue'.toUpperCase(),
            ),
    );
  }

  void showAlertDialog(BuildContext context) {
    // Create the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text('Do you want to add Joint Holders'),
      actions: [
        // You can add buttons to the alert dialog
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenJointHolders(),
              ),
            );
          },
          child: const Text('YES'),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ScreenNomineeCount(),
              ),
            );
            // Close the dialog
          },
          child: const Text('NO'),
        ),
      ],
    );

    // Show the AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
