import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ViewNewsScreen extends StatefulWidget {
  final String url;
  const ViewNewsScreen({super.key, required this.url});

  @override
  State<ViewNewsScreen> createState() => _ViewNewsScreenState();
}

class _ViewNewsScreenState extends State<ViewNewsScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News")),
      body: WebViewWidget(controller: _controller),
    );
  }
}
