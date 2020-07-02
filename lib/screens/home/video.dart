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
        initialUrl:getVideoUrl(),
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }

  getVideoUrl() {
      var item = widget.video[0];
      var test = item.embed
          .split("src=")[1]
          .split("frameborder")[0];
      String url = 
          test.substring(1,test.length -2);
      print('url $url stop');
      return url;
  }
}
