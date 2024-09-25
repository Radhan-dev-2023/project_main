import 'dart:developer';
import 'package:finfresh_mobile/controller/expense%20summary%20controller/expense_summary_controller.dart';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScreenWebviewForExpense extends StatefulWidget {
  final String url;
  const ScreenWebviewForExpense({super.key, required this.url});

  @override
  State<ScreenWebviewForExpense> createState() => _ScreenWebviewForExpense();
}

class _ScreenWebviewForExpense extends State<ScreenWebviewForExpense> {
  var controller = WebViewController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller
      ..enableZoom(true)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) async {
            // debugPrint('Page finished loading: $url');
            if (url.contains(
                "https://webhookandredirecturl.onrender.com/return-url")) {
              if (mounted) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text("Please Wait"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text(
                            "It takes some time, please wait...",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                );
                bool resul = await Provider.of<ExpenseSummaryController>(
                        context,
                        listen: false)
                    .fetchStatusCheck(context);
                if (resul) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
                //     .then((_) {
                //   Navigator.pop(context);
                //   Navigator.pop(context);
                // });
              }
            }
          },
          onUrlChange: (change) {
            log('onchangeurl:${change.url}');
            if (change.url!.contains('SUCCESS')) {
              showFlushbar(context, ' success');
            } else if (change.url!.contains('FAILURE')) {
              log('url:${change.toString()}');
              showFlushbar(context, 'Paymet failed');
            }
          },
          onProgress: (int progress) {
            const Center(
              child: LoadingWidget(),
            );
          },
          onWebResourceError: (WebResourceError error) {
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
