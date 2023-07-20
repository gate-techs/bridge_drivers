import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({
    Key? key,
    required this.paymentURL,
  }) : super(key: key);
  final String paymentURL;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: WebViewPlus(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: paymentURL,
            onWebViewCreated: (controller) {
              // controller.loadString(_controller.htmlScript);
              controller.webViewController.clearCache();
            },
          ),
        ));
  }
}
