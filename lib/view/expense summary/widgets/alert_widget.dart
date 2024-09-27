import 'package:finfresh_mobile/controller/expense%20summary%20controller/expense_summary_controller.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/expense%20summary/widgets/screen_webviewforexpense.dart';
import 'package:finfresh_mobile/view/widgets/custom_button_widget.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomInputContainer extends StatefulWidget {
  const CustomInputContainer({
    Key? key,
  }) : super(key: key);

  @override
  _CustomInputContainerState createState() => _CustomInputContainerState();
}

class _CustomInputContainerState extends State<CustomInputContainer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseSummaryController>(
        builder: (context, controller, _) {
      return Container(
        width: Adaptive.w(90),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Form(
          key: controller.formKeyInExpense,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button in the top-right corner
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    controller.changevisibleInButton(false);
                    // Add your close logic here
                  },
                ),
              ),

              // Text label
              const Text(
                "Enter Phone Number",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // TextFormField for phone number input
              TextFormField(
                style: Theme.of(context).textTheme.labelLarge!,
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: controller.phoneController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  // fillColor: const Color(0xFF0E1330),
                  // filled: true,
                  prefix: const Text('+91 '),
                  hintText: 'Enter Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }

                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Send SMS button
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: Adaptive.w(55),
                  child: controller.isLoading
                      ? SizedBox(
                          width: Adaptive.w(55), child: const LoadingButton())
                      : ButtonWidget(
                          btName: "Send SMS",
                          onTap: () async {
                            // String phoneNumber = controller.phoneController.text.trim();
                            if (controller.formKeyInExpense.currentState!
                                .validate()) {
                              String? url =
                                  await controller.generateUrl(context);
                              print('----------->>>>>url $url');
                              if (url != null) {
                                showFlushbar(context,
                                    'You will need to complete Digitap Verification');

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ScreenWebviewForExpense(url: url)),
                                );
                                controller.changevisibleInButton(false);
                              } else {
                                showFlushbar(
                                    context, "Failed to Digitap Verification");
                              }
                            } else {
                              showFlushbar(
                                  context, "Please enter a phone number");
                            }
                          },
                        ),
                ),
                // child: ElevatedButton(
                //   onPressed: () {
                //     String phoneNumber = phoneController.text.trim();
                //     if (phoneNumber.isNotEmpty) {
                //       // Trigger the submit action
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         const SnackBar(
                //             content: Text("Please enter a phone number")),
                //       );
                //     }
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color.fromRGBO(53, 120, 170, 1),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //   ),
                //   child: const Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                //     child: Text(
                //       "Send SMS",
                //       style: TextStyle(fontSize: 16, color: Colors.white),
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
