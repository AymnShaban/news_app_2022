import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({Key? key, required this.url}) : super(key: key);
final String url ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
