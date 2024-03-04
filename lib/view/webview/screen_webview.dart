import 'dart:developer';
import 'package:finfresh_mobile/utilities/constant/flushbar.dart';
import 'package:finfresh_mobile/view/homeScreen/screen_home_view_screen.dart';
import 'package:finfresh_mobile/view/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScreenWebview extends StatefulWidget {
  final String url;
  const ScreenWebview({super.key, required this.url});

  @override
  State<ScreenWebview> createState() => _ScreenWebviewState();
}

class _ScreenWebviewState extends State<ScreenWebview> {
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
          onUrlChange: (change) {
            log('onchangeurl:$change');
            if (change.url!.contains('SUCCESS')) {
              showFlushbar(context, 'Paymet success');
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ScreenHomeView()),
                (route) => false,
              );
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
