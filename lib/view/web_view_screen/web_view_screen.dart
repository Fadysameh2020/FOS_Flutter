
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../reusable_widgets/auth_back_button_widget.dart';
import '../../reusable_widgets/default_loading_widget.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({
    super.key,
    required this.url,
  });

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Stack(
          children: [
            Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(url: WebUri(widget.url)),
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    setState(() {
                      isLoading = true;
                    });
                  },
                  onLoadStop: (controller, url) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: AuthBackButtonWidget(),
                ),
              ],
            ),
            if (isLoading) const DefaultLoadingWidget(),
          ],
        ),
      ),
    );
  }
}
