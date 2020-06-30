import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:boolu/model/api.dart';

class Video extends StatefulWidget {
  final List<Videos> video;
  Video({this.video});
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String url;
  @override
  void initState() {
    super.initState();
    url = getVideoUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: getVideoUrl(),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }

  getVideoUrl() {
    for (var item in widget.video) {
      String url = item.embed
          .toString()
          .split(" src='")[1]
          .split(" ' frameborder")[0]
          .replaceFirst('https://', '');
      print(url);
      return url;
    }
  }
}
